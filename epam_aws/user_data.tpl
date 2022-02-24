#!/bin/bash

yum -y update

#----variable will be populated by terraform template
db_username=${db_username}
db_user_password=${db_user_password}
db_name=${db_name}
db_RDS=${db_rds}
efs_mount=${efs_endpoint}
full_path=${full_mount_path}
syml_path=${symlink_path}

#-------EFS-----------------------
sudo yum install -y amazon-efs-utils
sudo mkdir -p $full_path
#------mount EFS------------------
sudo mount -t efs $efs_mount:/ $full_path

#-----install httpd
yum -y install httpd

#----install mysql client
yum install -y mysql

#-----first enable php7.xx from  amazon-linux-extra and install it

amazon-linux-extras enable php7.4
yum clean metadata
yum install -y php php-{pear,cgi,common,curl,mbstring,gd,mysqlnd,gettext,bcmath,json,xml,fpm,intl,zip,imap,devel}
#install imagick extension
yum -y install gcc ImageMagick ImageMagick-devel ImageMagick-perl
pecl install imagick
chmod 755 /usr/lib64/php/modules/imagick.so
cat <<EOF >>/etc/php.d/20-imagick.ini

extension=imagick

EOF

systemctl restart php-fpm.service

# Change OWNER and permission of directory /var/www
usermod -aG apache ec2-user
chown -R ec2-user:apache /var/www
find /var/www -type d -exec chmod 2775 {} \;
find /var/www -type f -exec chmod 0664 {} \;

# #**********************Installing Wordpress manually*********************************
# # Download wordpress package and extract
wget https://wordpress.org/latest.tar.gz
tar -xzf latest.tar.gz
cp -r wordpress/* /var/www/html/
# Create wordpress configuration file and update database value
cd /var/www/html
cp wp-config-sample.php wp-config.php
sed -i "s/database_name_here/$db_name/g" wp-config.php
sed -i "s/username_here/$db_username/g" wp-config.php
sed -i "s/password_here/$db_user_password/g" wp-config.php
sed -i "s/localhost/$db_RDS/g" wp-config.php
cat <<EOF >>/var/www/html/wp-config.php
define('FS_METHOD', 'direct' );
define('WP_MEMORY_LIMIT', '128M');
EOF

sudo rm -rf $syml_path
sudo ln -snf $full_path $syml_path

# Change permission of /var/www/html/
chown -R ec2-user:apache /var/www/html
chmod -R 774 /var/www/html

#  enable .htaccess files in Apache config using sed command
sed -i '/<Directory "\/var\/www\/html">/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/httpd/conf/httpd.conf

MYIP=`curl http://169.254.169.254/latest/meta-data/local-ipv4`
echo "<h2>WordPress Installed !!!<br>WebServer with IP - $MYIP</h2><br>External file script.<br>Powered by Terraform from Chertanovo :) <br>Version 3.4</h2>" > /var/www/html/ip.html
#------apache  autostart and restart apache and php finally
systemctl restart php-fpm.service
systemctl enable  httpd.service
systemctl restart httpd.service

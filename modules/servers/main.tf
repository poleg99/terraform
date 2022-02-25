data "aws_availability_zones" "available" {}

data "aws_ami" "aml" {
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-2.0.*.0-x86_64-gp2"]
  }
  owners = ["137112412989"]
}

data "template_file" "user_data" {
  template = file("user_data.tpl")
  vars = {
    db_username      = var.database_user
    db_user_password = var.database_password
    db_name          = var.database_name
    db_rds           = aws_db_instance.wordpressdb.endpoint
    efs_endpoint     = aws_efs_file_system.efs.id
    full_mount_path  = var.full_mount_path
    symlink_path     = var.wp_upload_path
  }
}

#----------Creating EFS file system--------------------------
resource "aws_efs_file_system" "efs" {
  creation_token   = "wordpress_efs_2"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  encrypted        = "false"
  tags             = merge(var.tags, { Name = "${var.env}-efs" })
}

#----------Creating Mount target of EFS--------------------
resource "aws_efs_mount_target" "efs_mount" {
  count           = length(var.efs_subnets)
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = element(var.efs_subnets, count.index)
  security_groups = [aws_security_group.web_sg.id]
}

#------------Create MySQL dbserver------------------------
resource "aws_db_instance" "wordpressdb" {
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "5.7"
  instance_class          = var.db_server_size
  db_subnet_group_name    = var.db_subnet_name
  vpc_security_group_ids  = ["${aws_security_group.db_sg.id}"]
  db_name                 = var.database_name
  username                = var.database_user
  password                = var.database_password
  backup_retention_period = 1
  apply_immediately       = true
  skip_final_snapshot     = true
  multi_az                = true
}

#-----------------Servers------------------------------------
resource "aws_launch_configuration" "as_conf" {
  name_prefix     = "web_config-"
  image_id        = data.aws_ami.aml.id
  instance_type   = var.web_server_size
  security_groups = [aws_security_group.web_sg.id]
  user_data       = data.template_file.user_data.rendered
  lifecycle {
    create_before_destroy = true
  }
}

#---------------Create auto scaling group---------------------
resource "aws_autoscaling_group" "web" {
  name                 = "terraform-asg-${aws_launch_configuration.as_conf.name}"
  launch_configuration = aws_launch_configuration.as_conf.name
  min_size             = 2
  max_size             = 2
  health_check_type    = "ELB"
  vpc_zone_identifier  = var.servers_subnets
  load_balancers       = [aws_elb.web.name]
  lifecycle {
    create_before_destroy = true
  }
  depends_on = [aws_db_instance.wordpressdb, aws_efs_file_system.efs]
}

#---------------Create ELB---------------------------------
resource "aws_elb" "web" {
  name            = "web-elb-ha"
  subnets         = var.nlb_subnets
  security_groups = [aws_security_group.web_sg.id]

  dynamic "listener" {
    for_each = ["80"]
    content {
      instance_port     = listener.value
      instance_protocol = "http"
      lb_port           = listener.value
      lb_protocol       = "http"
    }
  }

  health_check {
    healthy_threshold   = 3
    unhealthy_threshold = 5
    timeout             = 5
    target              = "HTTP:80/ip.html"
    interval            = 10
  }
  tags = merge(var.tags, { Name = "${var.env}-web_elb" })
}

#-------------Create Security group for webservers----------
resource "aws_security_group" "web_sg" {
  name        = "webserver-sg"
  description = "security group for webservers"
  vpc_id      = var.vpc_id_data

  dynamic "ingress" {
    for_each = ["80", "443", "3306", "2049"]
    content {
      description = "bunch of TCP ports for webservers"
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    description = "egress for webservers"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.tags, { Name = "${var.env}-webservers_sg" })
}

#-------------Create Security group for dbservers----------
resource "aws_security_group" "db_sg" {
  name        = "dbserver-sg"
  description = "security group for dbservers"
  vpc_id      = var.vpc_id_data

  ingress {
    description     = "port for mysql dbservers"
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = ["0.0.0.0/0"]
    security_groups = ["${aws_security_group.web_sg.id}"]
  }
  egress {
    description = "egress for dbservers"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = merge(var.tags, { Name = "${var.env}-dbservers_sg" })
}

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |
| <a name="provider_template"></a> [template](#provider\_template) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_autoscaling_group.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/autoscaling_group) | resource |
| [aws_db_instance.wordpressdb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/db_instance) | resource |
| [aws_efs_file_system.efs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_file_system) | resource |
| [aws_efs_mount_target.efs_mount](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/efs_mount_target) | resource |
| [aws_elb.web](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elb) | resource |
| [aws_launch_configuration.as_conf](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/launch_configuration) | resource |
| [aws_security_group.db_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group.web_sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_ami.aml](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_availability_zones.available](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/availability_zones) | data source |
| [template_file.user_data](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_database_name"></a> [database\_name](#input\_database\_name) | database name for wordpress | `string` | `"wordpressdb"` | no |
| <a name="input_database_password"></a> [database\_password](#input\_database\_password) | database pass for wordpress db | `string` | `"Passw0rd123!"` | no |
| <a name="input_database_user"></a> [database\_user](#input\_database\_user) | database user for wordpress | `string` | `"wordpressuser"` | no |
| <a name="input_db_server_size"></a> [db\_server\_size](#input\_db\_server\_size) | db type | `string` | `"db.t3.small"` | no |
| <a name="input_db_subnet_name"></a> [db\_subnet\_name](#input\_db\_subnet\_name) | subnet name for DB | `string` | n/a | yes |
| <a name="input_efs_subnets"></a> [efs\_subnets](#input\_efs\_subnets) | efs subnet for deploy | `list(any)` | n/a | yes |
| <a name="input_env"></a> [env](#input\_env) | environment for infrastructure to deploy | `string` | `"dev"` | no |
| <a name="input_full_mount_path"></a> [full\_mount\_path](#input\_full\_mount\_path) | efs directory full path | `string` | `"/var/www/html/efs/uploads"` | no |
| <a name="input_nlb_subnets"></a> [nlb\_subnets](#input\_nlb\_subnets) | nlb subnets | `any` | n/a | yes |
| <a name="input_servers_subnets"></a> [servers\_subnets](#input\_servers\_subnets) | servers subnet for deploy | `list(any)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | default tags | `map` | <pre>{<br>  "Owner": "Oleg Pavlov",<br>  "Project": "EPAM DEVOPS SCHOOL AWS TASK"<br>}</pre> | no |
| <a name="input_vpc_id_data"></a> [vpc\_id\_data](#input\_vpc\_id\_data) | vpc id for servers | `any` | n/a | yes |
| <a name="input_web_server_size"></a> [web\_server\_size](#input\_web\_server\_size) | EC2 type | `string` | `"t3.micro"` | no |
| <a name="input_wp_upload_path"></a> [wp\_upload\_path](#input\_wp\_upload\_path) | full path for symlink where to store images | `string` | `"/var/www/html/wp-content/uploads"` | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | zone name where to deploy servers | `string` | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_efs_filesystem_endpoint"></a> [efs\_filesystem\_endpoint](#output\_efs\_filesystem\_endpoint) | efs filesystem endpoint |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | db rds endpoint |
| <a name="output_web_dns_name"></a> [web\_dns\_name](#output\_web\_dns\_name) | web lb URL for connection |
<!-- END_TF_DOCS -->
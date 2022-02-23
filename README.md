requirements:

- AWS account and token
- terraform installed
- S3 bucket for storing configuration

## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_epam_task_network"></a> [epam\_task\_network](#module\_epam\_task\_network) | ../modules/network | n/a |
| <a name="module_epam_task_servers"></a> [epam\_task\_servers](#module\_epam\_task\_servers) | ../modules/servers | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_env"></a> [env](#input\_env) | n/a | `string` | `"dev"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map` | <pre>{<br>  "Owner": "Oleg Pavlov",<br>  "Project": "EPAM DEVOPS SCHOOL AWS TASK"<br>}</pre> | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | ----------General-------------- | `string` | `"eu-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_av_zones"></a> [all\_av\_zones](#output\_all\_av\_zones) | ----------Network----------------- |
| <a name="output_db_subnet_ids"></a> [db\_subnet\_ids](#output\_db\_subnet\_ids) | n/a |
| <a name="output_efs_filesystem_endpoint"></a> [efs\_filesystem\_endpoint](#output\_efs\_filesystem\_endpoint) | ----------endpoint\_full\_hostname |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | n/a |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | n/a |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | n/a |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | n/a |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_web_dns_name"></a> [web\_dns\_name](#output\_web\_dns\_name) | ------------Servers---------------- |

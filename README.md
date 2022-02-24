## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.10 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 2.4.0 |

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
| <a name="input_env"></a> [env](#input\_env) | set stages | `string` | `"dev"` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | common tags | `map` | <pre>{<br>  "Owner": "Oleg Pavlov",<br>  "Project": "EPAM DEVOPS SCHOOL AWS TASK"<br>}</pre> | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | set zone for infrastructure creation | `string` | `"eu-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_all_av_zones"></a> [all\_av\_zones](#output\_all\_av\_zones) | list of all av zones |
| <a name="output_db_subnet_ids"></a> [db\_subnet\_ids](#output\_db\_subnet\_ids) | DB subnets id |
| <a name="output_efs_filesystem_endpoint"></a> [efs\_filesystem\_endpoint](#output\_efs\_filesystem\_endpoint) | EFS endpoint |
| <a name="output_private_subnet_ids"></a> [private\_subnet\_ids](#output\_private\_subnet\_ids) | pricate subnets id |
| <a name="output_public_subnet_ids"></a> [public\_subnet\_ids](#output\_public\_subnet\_ids) | public subnets id |
| <a name="output_rds_endpoint"></a> [rds\_endpoint](#output\_rds\_endpoint) | mysql RDS endpoint |
| <a name="output_vpc_cidr"></a> [vpc\_cidr](#output\_vpc\_cidr) | created VPC CIDR block |
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | created VPC\_ID |
| <a name="output_web_lb_url"></a> [web\_lb\_url](#output\_web\_lb\_url) | URL for connection |

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

No inputs.

## Outputs

No outputs.
<!-- END_TF_DOCS -->
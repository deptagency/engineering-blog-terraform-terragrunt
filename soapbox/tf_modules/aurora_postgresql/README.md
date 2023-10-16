## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.5 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.7.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.7.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aurora_postgresql"></a> [aurora\_postgresql](#module\_aurora\_postgresql) | terraform-aws-modules/rds-aurora/aws | 8.3.1 |

## Resources

| Name | Type |
|------|------|
| [aws_subnet.private_vpc_subnet](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnet) | data source |
| [aws_subnets.private_vpc_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.env_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | Name of application | `string` | n/a | yes |
| <a name="input_aurora_autoscaling_max_capacity"></a> [aurora\_autoscaling\_max\_capacity](#input\_aurora\_autoscaling\_max\_capacity) | Maximum number of instances in Aurora cluster | `number` | `3` | no |
| <a name="input_aurora_autoscaling_min_capacity"></a> [aurora\_autoscaling\_min\_capacity](#input\_aurora\_autoscaling\_min\_capacity) | Minimum number of instances in Aurora cluster | `number` | `1` | no |
| <a name="input_aurora_autoscaling_target_cpu"></a> [aurora\_autoscaling\_target\_cpu](#input\_aurora\_autoscaling\_target\_cpu) | Target CPU for Aurora autoscaling | `number` | `70` | no |
| <a name="input_aurora_backup_retention_period"></a> [aurora\_backup\_retention\_period](#input\_aurora\_backup\_retention\_period) | Backup retention period for Aurora cluster | `number` | `7` | no |
| <a name="input_aurora_instance_class"></a> [aurora\_instance\_class](#input\_aurora\_instance\_class) | DB Instance class | `string` | `"db.t4g.large"` | no |
| <a name="input_aurora_performance_insights_enabled"></a> [aurora\_performance\_insights\_enabled](#input\_aurora\_performance\_insights\_enabled) | Enable Performance Insights | `bool` | `true` | no |
| <a name="input_aurora_performance_insights_retention_period"></a> [aurora\_performance\_insights\_retention\_period](#input\_aurora\_performance\_insights\_retention\_period) | Retention period for Performance Insights | `number` | `7` | no |
| <a name="input_aurora_preferred_backup_window"></a> [aurora\_preferred\_backup\_window](#input\_aurora\_preferred\_backup\_window) | Preferred backup window for Aurora cluster (UTC) | `string` | `"04:00-05:00"` | no |
| <a name="input_aurora_preferred_maintenance_window"></a> [aurora\_preferred\_maintenance\_window](#input\_aurora\_preferred\_maintenance\_window) | Preferred maintenance window for Aurora cluster (UTC | `string` | `"sun:09:00-sun:10:00"` | no |
| <a name="input_aurora_version"></a> [aurora\_version](#input\_aurora\_version) | Version of Aurora PostgreSQL | `string` | `"15.3"` | no |
| <a name="input_environment_name"></a> [environment\_name](#input\_environment\_name) | Name of environment | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `map(string)` | `{}` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of VPC | `string` | n/a | yes |

## Outputs

No outputs.

# PBS TF ElastiCache Redis Standalone Module

## Installation

### Using the Repo Source

Use this URL for the source of the module. See the usage examples below for more details.

```hcl
github.com/pbs/terraform-aws-elasticache-redis-standalone-module?ref=x.y.z
```

### Alternative Installation Methods

More information can be found on these install methods and more in [the documentation here](./docs/general/install).

## Usage

<!-- TODO -->

This should be a basic description of what this module does.
Fill this out before completing usage of this template.

<!-- TODO -->

Integrate this module like so:

```hcl
module "elasticache-redis-standalone" {
  source = "github.com/pbs/terraform-aws-elasticache-redis-standalone-module?ref=x.y.z"

  <!-- TODO -->
  Show some examples of valid values for required parameters.
  <!-- TODO -->

  # Tagging Parameters
  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo

  # Optional Parameters
}
```

## Adding This Version of the Module

If this repo is added as a subtree, then the version of the module should be close to the version shown here:

`x.y.z`

Note, however that subtrees can be altered as desired within repositories.

Further documentation on usage can be found [here](./docs).

Below is automatically generated documentation on this Terraform module using [terraform-docs][terraform-docs]

---

[terraform-docs]: https://github.com/terraform-docs/terraform-docs

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.26.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_elasticache_cluster.cluster](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_cluster) | resource |
| [aws_elasticache_parameter_group.elasticache_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_parameter_group) | resource |
| [aws_elasticache_subnet_group.subnet_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/elasticache_subnet_group) | resource |
| [aws_security_group.sg](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_security_group_rule.egress](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_subnets.private_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |
| [aws_vpc.vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_environment"></a> [environment](#input\_environment) | Environment (sharedtools, dev, staging, qa, prod) | `string` | n/a | yes |
| <a name="input_organization"></a> [organization](#input\_organization) | Organization using this module. Used to prefix tags so that they are easily identified as being from your organization | `string` | n/a | yes |
| <a name="input_product"></a> [product](#input\_product) | Tag used to group resources according to product | `string` | n/a | yes |
| <a name="input_repo"></a> [repo](#input\_repo) | Tag used to point to the repo using this module | `string` | n/a | yes |
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | Whether any database modifications are applied immediately, or during the next maintenance window. | `bool` | `false` | no |
| <a name="input_auto_minor_version_upgrade"></a> [auto\_minor\_version\_upgrade](#input\_auto\_minor\_version\_upgrade) | Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported for engine type "redis" and if the engine version is 6 or higher. | `bool` | `true` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | Availability Zone for the cache cluster. If you want to create cache nodes in multi-az, use preferred\_availability\_zones instead. Default: System chosen Availability Zone. Changing this value will re-create the resource. | `string` | `null` | no |
| <a name="input_engine_version"></a> [engine\_version](#input\_engine\_version) | Version number of the cache engine to be used. If not set, defaults to the latest version. See Describe Cache Engine Versions in the AWS Documentation for supported versions. When engine is redis and the version is 6 or higher, the major and minor version can be set, e.g., 6.2, or the minor version can be unspecified which will use the latest version at creation time, e.g., 6.x. Otherwise, specify the full version desired, e.g., 5.0.6. | `string` | `null` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | Name of your final cluster snapshot. If omitted, no final snapshot will be made. | `string` | `null` | no |
| <a name="input_maintenance_window"></a> [maintenance\_window](#input\_maintenance\_window) | Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00. | `string` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the ElastiCache Redis instance. If null, will default to product. | `string` | `null` | no |
| <a name="input_node_type"></a> [node\_type](#input\_node\_type) | ElastiCache node type | `string` | `"cache.t3.micro"` | no |
| <a name="input_notification_topic_arn"></a> [notification\_topic\_arn](#input\_notification\_topic\_arn) | ARN of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my\_sns\_topic. | `string` | `null` | no |
| <a name="input_parameters"></a> [parameters](#input\_parameters) | Additional parameters that will be added to parameter group. | `list(map(any))` | `[]` | no |
| <a name="input_port"></a> [port](#input\_port) | The port number on which each of the cache nodes will accept connections. Cannot be provided with replication\_group\_id. Changing this value will re-create the resource. | `number` | `6379` | no |
| <a name="input_security_group_ids"></a> [security\_group\_ids](#input\_security\_group\_ids) | One or more VPC security groups associated with the cache cluster. If null, use the one provided by this module. | `list(string)` | `null` | no |
| <a name="input_sg_name"></a> [sg\_name](#input\_sg\_name) | Name of the security group to be created. If null, will use the name of the cache cluster. | `string` | `null` | no |
| <a name="input_snapshot_arns"></a> [snapshot\_arns](#input\_snapshot\_arns) | Single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. The object name cannot contain any commas. Changing snapshot\_arns forces a new resource. | `list(string)` | `null` | no |
| <a name="input_snapshot_name"></a> [snapshot\_name](#input\_snapshot\_name) | Name of a snapshot from which to restore data into the new node group. Changing snapshot\_name forces a new resource. | `string` | `null` | no |
| <a name="input_snapshot_retention_limit"></a> [snapshot\_retention\_limit](#input\_snapshot\_retention\_limit) | Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot\_retention\_limit is not supported on cache.t1.micro cache nodes. | `number` | `null` | no |
| <a name="input_snapshot_window"></a> [snapshot\_window](#input\_snapshot\_window) | Daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. Example: 05:00-09:00 | `string` | `null` | no |
| <a name="input_subnet_data_lookup_filters"></a> [subnet\_data\_lookup\_filters](#input\_subnet\_data\_lookup\_filters) | Values of the `filter` blocks in the `aws_subnets` data source used in this module. If null, one will be guessed using the resolved VPC and a `Name` filter of `*-private-*`. Ignored if `subnets` is populated. | <pre>list(object({<br>    name   = string<br>    values = list(string)<br>  }))</pre> | `null` | no |
| <a name="input_subnet_group_name"></a> [subnet\_group\_name](#input\_subnet\_group\_name) | Name of the subnet group to be used for the cache cluster. Changing this value will re-create the resource. If null, will use the subnet group created by this module. | `string` | `null` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | List of subnet IDs to create cluster nodes in. If null, a list will be generated by looking up subnets in the resolved VPC. | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Extra tags | `map(string)` | `{}` | no |
| <a name="input_use_prefix"></a> [use\_prefix](#input\_use\_prefix) | Whether to use prefixes in the resource names. If false, will use a fully specified name for resources. | `bool` | `true` | no |
| <a name="input_vpc_data_lookup_tags"></a> [vpc\_data\_lookup\_tags](#input\_vpc\_data\_lookup\_tags) | Value of the `tags` parameter in the `aws_vpc` data source used in this module. If null, a dynamic lookup based on `environment` will be used. Ignored if `vpc_id` is populated. | `map(string)` | `null` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID to create the cache cluster in. If null, one will be guessed based on `vpc_data_lookup_tags`. | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_name"></a> [name](#output\_name) | The name |
| <a name="output_security_group_ids"></a> [security\_group\_ids](#output\_security\_group\_ids) | The security group ids |
| <a name="output_tags"></a> [tags](#output\_tags) | The tags |

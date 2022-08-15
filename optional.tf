variable "name" {
  description = "Name of the ElastiCache Redis instance. If null, will default to product."
  default     = null
  type        = string
}

variable "node_type" {
  description = "ElastiCache node type"
  default     = "cache.t3.micro"
  type        = string
}

variable "apply_immediately" {
  description = "Whether any database modifications are applied immediately, or during the next maintenance window."
  default     = false
  type        = bool
}

variable "auto_minor_version_upgrade" {
  description = "Specifies whether minor version engine upgrades will be applied automatically to the underlying Cache Cluster instances during the maintenance window. Only supported for engine type \"redis\" and if the engine version is 6 or higher."
  default     = true
  type        = bool
}

variable "availability_zone" {
  description = "Availability Zone for the cache cluster. If you want to create cache nodes in multi-az, use preferred_availability_zones instead. Default: System chosen Availability Zone. Changing this value will re-create the resource."
  default     = null
  type        = string
}

variable "engine_version" {
  description = "Version number of the cache engine to be used. If not set, defaults to the latest version. See Describe Cache Engine Versions in the AWS Documentation for supported versions. When engine is redis and the version is 6 or higher, the major and minor version can be set, e.g., 6.2, or the minor version can be unspecified which will use the latest version at creation time, e.g., 6.x. Otherwise, specify the full version desired, e.g., 5.0.6."
  default     = null
  type        = string
}

variable "final_snapshot_identifier" {
  description = "Name of your final cluster snapshot. If omitted, no final snapshot will be made."
  default     = null
  type        = string
}

variable "maintenance_window" {
  description = "Specifies the weekly time range for when maintenance on the cache cluster is performed. The format is ddd:hh24:mi-ddd:hh24:mi (24H Clock UTC). The minimum maintenance window is a 60 minute period. Example: sun:05:00-sun:09:00."
  default     = null
  type        = string
}

variable "notification_topic_arn" {
  description = "ARN of an SNS topic to send ElastiCache notifications to. Example: arn:aws:sns:us-east-1:012345678999:my_sns_topic."
  default     = null
  type        = string
}

variable "port" {
  description = "The port number on which each of the cache nodes will accept connections. Cannot be provided with replication_group_id. Changing this value will re-create the resource."
  default     = 6379
  type        = number
}

variable "security_group_ids" {
  description = "One or more VPC security groups associated with the cache cluster. If null, use the one provided by this module."
  default     = null
  type        = list(string)
}

variable "snapshot_arns" {
  description = "Single-element string list containing an Amazon Resource Name (ARN) of a Redis RDB snapshot file stored in Amazon S3. The object name cannot contain any commas. Changing snapshot_arns forces a new resource."
  default     = null
  type        = list(string)
}

variable "snapshot_name" {
  description = "Name of a snapshot from which to restore data into the new node group. Changing snapshot_name forces a new resource."
  default     = null
  type        = string
}

variable "snapshot_retention_limit" {
  description = "Number of days for which ElastiCache will retain automatic cache cluster snapshots before deleting them. For example, if you set SnapshotRetentionLimit to 5, then a snapshot that was taken today will be retained for 5 days before being deleted. If the value of SnapshotRetentionLimit is set to zero (0), backups are turned off. Please note that setting a snapshot_retention_limit is not supported on cache.t1.micro cache nodes."
  default     = null
  type        = number
}

variable "snapshot_window" {
  description = "Daily time range (in UTC) during which ElastiCache will begin taking a daily snapshot of your cache cluster. Example: 05:00-09:00"
  default     = null
  type        = string
}

variable "subnet_group_name" {
  description = "Name of the subnet group to be used for the cache cluster. Changing this value will re-create the resource. If null, will use the subnet group created by this module."
  default     = null
  type        = string
}

variable "parameters" {
  description = "Additional parameters that will be added to parameter group."
  type        = list(map(any))
  default     = []
}

variable "vpc_id" {
  description = "VPC ID to create the cache cluster in. If null, one will be guessed based on `vpc_data_lookup_tags`."
  default     = null
  type        = string
}

variable "vpc_data_lookup_tags" {
  description = "Value of the `tags` parameter in the `aws_vpc` data source used in this module. If null, a dynamic lookup based on `environment` will be used. Ignored if `vpc_id` is populated."
  default     = null
  type        = map(string)
}

variable "subnets" {
  description = "List of subnet IDs to create cluster nodes in. If null, a list will be generated by looking up subnets in the resolved VPC."
  default     = null
  type        = list(string)
}

variable "subnet_data_lookup_filters" {
  description = "Values of the `filter` blocks in the `aws_subnets` data source used in this module. If null, one will be guessed using the resolved VPC and a `Name` filter of `*-private-*`. Ignored if `subnets` is populated."
  default     = null
  type = list(object({
    name   = string
    values = list(string)
  }))
}

variable "use_prefix" {
  description = "Whether to use prefixes in the resource names. If false, will use a fully specified name for resources."
  default     = true
  type        = bool
}

variable "sg_name" {
  description = "Name of the security group to be created. If null, will use the name of the cache cluster."
  default     = null
  type        = string
}

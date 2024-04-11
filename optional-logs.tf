variable "create_log_group" {
  description = "Flag for creating a CloudWatch log group."
  default     = false
  type        = bool
}

variable "service_name" {
  description = "Name of the service running this task. Only important here because the AWS console defaults to `/ecs/service_name` when displaying logs for a service"
  default     = null
  type        = string
}

variable "log_group_class" {
  description = "Log class of the log group. Possible values are: STANDARD or INFREQUENT_ACCESS."
  default     = "INFREQUENT_ACCESS"
  type        = string
}

variable "retention_in_days" {
  description = "Log retention in days"
  default     = 7
  type        = number
}

variable "log_destination" {
  description = "Name of externally created CloudWatch Logs LogGroup or Kinesis Data Firehose resource. If any specified, create_log_group will be ignored."
  default     = null
  type        = string
}

variable "log_destination_type" {
  description = "For CloudWatch Logs use cloudwatch-logs or for Kinesis Data Firehose use kinesis-firehose."
  default     = "cloudwatch-logs"
  type        = string
}

variable "log_format" {
  description = "Log format with valid values of json or text."
  default     = "text"
  type        = string
}

variable "log_type" {
  description = "Log type with valid values of slow-log or engine-log."
  default     = "slow-log"
  type        = string
}

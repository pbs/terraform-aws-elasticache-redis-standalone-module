resource "aws_elasticache_parameter_group" "parameter_group" {
  name   = local.name
  family = "${local.engine}${var.parameter_group_version}"

  description = "ElastiCache parameter group for ${local.name} ${local.engine}"

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

resource "aws_elasticache_parameter_group" "elasticache_parameter_group" {
  name   = local.name
  family = "${local.engine}-${replace(var.engine_version, "/\\.[\\d]+$/", "")}"

  description = "ElastiCache parameter group for ${local.name} ${local.engine}"

  dynamic "parameter" {
    for_each = var.parameters
    content {
      name  = parameter.value.name
      value = parameter.value.value
    }
  }
}

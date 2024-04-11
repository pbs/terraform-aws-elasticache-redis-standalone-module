resource "aws_cloudwatch_log_group" "logs" {
  count = local.create_log_group == true ? 1 : 0

  name = local.log_destination

  retention_in_days = var.retention_in_days

  log_group_class = var.log_group_class

  tags = {
    Name        = "${local.service_name} Log Group"
    application = var.product
    environment = var.environment
    creator     = local.creator
  }
}

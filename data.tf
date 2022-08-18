data "aws_vpc" "vpc" {
  count = var.vpc_id == null ? 1 : 0
  tags  = local.vpc_data_lookup_tags
}

data "aws_subnets" "private_subnets" {
  count = var.subnets == null ? 1 : 0
  dynamic "filter" {
    for_each = local.subnet_data_lookup_filters
    content {
      name   = filter.key
      values = filter.value
    }
  }
}

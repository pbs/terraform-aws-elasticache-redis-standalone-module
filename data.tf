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

data "aws_route53_zone" "private_hosted_zone" {
  count        = var.create_dns ? 1 : 0
  name         = "${var.private_hosted_zone}."
  private_zone = true
}

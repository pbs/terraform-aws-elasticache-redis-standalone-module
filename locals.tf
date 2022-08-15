locals {
  name               = var.name != null ? var.name : var.product
  security_group_ids = var.security_group_ids != null ? var.security_group_ids : [aws_security_group.sg.id]
  subnet_group_name  = var.subnet_group_name != null ? var.subnet_group_name : aws_elasticache_subnet_group.subnet_group.id
  vpc_id             = var.vpc_id != null ? var.vpc_id : data.aws_vpc.vpc[0].id
  subnets            = var.subnets != null ? var.subnets : data.aws_subnets.private_subnets[0].ids

  vpc_data_lookup_tags = var.vpc_data_lookup_tags != null ? var.vpc_data_lookup_tags : {
    "environment" : var.environment
  }

  // There's a useful hack being used here to convert the type of the list here to the type
  // defined in var.subnet_data_lookup_filters. We `coalescelist` to merge the null of type list(object)
  // to the literal defined here, as there's no way to explicitly cast to a list of object.
  subnet_data_lookup_filters = var.subnet_data_lookup_filters != null ? var.subnet_data_lookup_filters : coalescelist(var.subnet_data_lookup_filters, [
    {
      "vpc-id" = [local.vpc_id]
    },
    {
      "tag:Name" = ["*-private-*"]
    }
  ])

  sg_name        = var.use_prefix ? null : var.sg_name != null ? var.sg_name : local.name
  sg_name_prefix = var.use_prefix ? var.sg_name != null ? var.sg_name : local.name : null

  engine = "redis"

  creator = "terraform"

  tags = merge(
    var.tags,
    {
      Name                                      = local.name
      "${var.organization}:billing:product"     = var.product
      "${var.organization}:billing:environment" = var.environment
      creator                                   = local.creator
      repo                                      = var.repo
    }
  )
}

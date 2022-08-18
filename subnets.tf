resource "aws_elasticache_subnet_group" "subnet_group" {
  name       = local.name
  subnet_ids = local.subnets
}

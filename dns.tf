resource "aws_route53_record" "primary_endpoint" {
  count   = var.create_dns ? 1 : 0
  zone_id = local.private_hosted_zone
  name    = local.cname
  type    = "CNAME"
  ttl     = var.dns_ttl
  records = [aws_elasticache_replication_group.replication_group.primary_endpoint_address]
}

resource "aws_route53_record" "reader_endpoint" {
  count   = var.create_dns ? 1 : 0
  zone_id = local.private_hosted_zone
  name    = "${local.cname}-ro"
  type    = "CNAME"
  ttl     = var.dns_ttl
  records = [aws_elasticache_replication_group.replication_group.reader_endpoint_address]
}


resource "aws_elasticache_cluster" "cluster" {
  cluster_id           = local.name
  engine               = local.engine
  node_type            = var.node_type
  num_cache_nodes      = 1
  parameter_group_name = aws_elasticache_parameter_group.elasticache_parameter_group.id

  apply_immediately          = var.apply_immediately
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  availability_zone          = var.availability_zone
  engine_version             = var.engine_version
  final_snapshot_identifier  = var.final_snapshot_identifier
  maintenance_window         = var.maintenance_window
  notification_topic_arn     = var.notification_topic_arn
  port                       = var.port
  security_group_ids         = local.security_group_ids
  snapshot_arns              = var.snapshot_arns
  snapshot_name              = var.snapshot_name
  snapshot_retention_limit   = var.snapshot_retention_limit
  snapshot_window            = var.snapshot_window
  subnet_group_name          = local.subnet_group_name

  tags = local.tags
}

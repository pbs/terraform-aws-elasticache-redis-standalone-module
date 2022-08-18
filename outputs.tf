output "name" {
  description = "The name of the ElastiCache replication group"
  value       = aws_elasticache_replication_group.replication_group.id
}

output "arn" {
  description = "The ARN of the ElastiCache replication group"
  value       = aws_elasticache_replication_group.replication_group.arn
}

output "sg_ids" {
  description = "The security group ids"
  value       = local.security_group_ids
}

output "engine_version_actual" {
  description = "Because ElastiCache pulls the latest minor or patch for a version, this attribute returns the running version of the cache engine."
  value       = aws_elasticache_replication_group.replication_group.engine_version
}

output "member_clusters" {
  description = "Identifiers of all the nodes that are part of this replication group."
  value       = aws_elasticache_replication_group.replication_group.member_clusters
}

output "primary_endpoint_address" {
  description = "Address of the endpoint for the primary node in the replication group."
  value       = aws_elasticache_replication_group.replication_group.primary_endpoint_address
}

output "reader_endpoint_address" {
  description = "Address of the endpoint for the reader node in the replication group."
  value       = aws_elasticache_replication_group.replication_group.reader_endpoint_address
}

output "tags" {
  description = "The tags"
  value       = local.tags
}

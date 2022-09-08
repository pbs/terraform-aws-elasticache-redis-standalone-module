output "name" {
  description = "The name of the ElastiCache replication group"
  value       = module.redis.name
}

output "arn" {
  description = "The ARN of the ElastiCache replication group"
  value       = module.redis.arn
}

output "sg_ids" {
  description = "The security group ids"
  value       = module.redis.sg_ids
}

output "engine_version_actual" {
  description = "Because ElastiCache pulls the latest minor or patch for a version, this attribute returns the running version of the cache engine."
  value       = module.redis.engine_version_actual
}

output "member_clusters" {
  description = "Identifiers of all the nodes that are part of this replication group."
  value       = module.redis.member_clusters
}

output "primary_endpoint_address" {
  description = "Address of the endpoint for the primary node in the replication group."
  value       = module.redis.primary_endpoint_address
}

output "reader_endpoint_address" {
  description = "Address of the endpoint for the reader node in the replication group."
  value       = module.redis.reader_endpoint_address
}

output "tags" {
  description = "The tags"
  value       = module.redis.tags
}

output "lambda_name" {
  description = "The name of the lambda function"
  value       = module.lambda.name
}

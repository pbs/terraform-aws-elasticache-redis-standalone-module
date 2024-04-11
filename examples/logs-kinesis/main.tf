module "redis" {
  source = "../.."

  create_dns = false
  log_destination      = "some-kinesis-stream-name"
  log_destination_type = "kinesis-firehose"
  log_format           = "json"
  log_type             = "engine-log"

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}

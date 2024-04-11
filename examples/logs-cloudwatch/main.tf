module "redis" {
  source = "../.."

  create_dns = false
  create_log_group = true

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}

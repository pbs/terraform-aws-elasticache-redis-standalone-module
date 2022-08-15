module "elasticache-redis-standalone" {
  source = "../.."

  organization = var.organization
  environment  = var.environment
  product      = var.product
  repo         = var.repo
}

module "vpc" {
  source = "./modules/vpc"

  vpc_cidr              = "10.0.0.0/16"
  public_subnet_cidr    = "10.0.1.0/24"
  private_subnet_cidr   = "10.0.2.0/24"
  private_subnet_2_cidr = var.private_subnet_2_cidr
  availability_zone_2   = var.availability_zone_2
}
module "security" {
  source = "./modules/security"

  vpc_id = module.vpc.vpc_id
}
module "compute" {
  source = "./modules/compute"

  public_subnet_id      = module.vpc.public_subnet_id
  app_security_group_id = module.security.app_security_group_id
}
module "storage" {
  source = "./modules/storage"

  project_name = "changeis-senior-cloud-project"
}
module "database" {
  source = "./modules/database"

  private_subnet_ids    = module.vpc.private_subnet_ids
  vpc_id                = module.vpc.vpc_id
  db_username           = var.db_username
  db_password           = var.db_password
  app_security_group_id = module.security.app_security_group_id
}

module "monitoring" {
  source = "./modules/monitoring"

  app_instance_id = module.compute.app_instance_id
  alert_email     = var.alert_email
}
#################################################################
# VPC
#################################################################
module "vpc" {
  #  count       = var.create_vpc ? 1 : 0
  source      = "./modules/terraform-gauzy-vpc"
  environment = var.environment
  region      = var.region
}

#################################################################
# RDS
#################################################################
module "rds" {
  # count       = var.create_rds ? 1 : 0
  source                = "./modules/terraform-gauzy-rds"
  environment           = var.environment
  region                = var.region
  database_subnet_group = module.vpc.database_subnet_group
  vpc_cidr              = module.vpc.vpc_cidr
  vpc_id                = module.vpc.vpc_id
}

#################################################################
# EKS
#################################################################
module "eks" {
  #  count           = var.create_rds ? 1 : 0
  source            = "./modules/terraform-gauzy-eks"
  environment       = var.environment
  cluster_version   = var.cluster_version
  region            = var.region
  private-subnet_id = module.vpc.private-subnet_id
  vpc_id            = module.vpc.vpc_id
}

#################################################################
# HELM
#################################################################
module "helm" {
  #  count           = var.create_rds ? 1 : 0
  source                             = "./modules/terraform-gauzy-helm"
  environment                        = var.environment
  region                             = var.region
  name                               = var.name
  h_version                          = var.h_version
  chart                              = var.chart
  api_host                           = var.api_host
  api_secretName                     = var.api_secretName
  web_host                           = var.web_host
  web_secretName                     = var.web_secretName
  cluster_endpoint                   = module.eks.cluster_endpoint
  cluster_certificate_authority_data = module.eks.cluster_certificate_authority_data
  cluster_name                       = module.eks.cluster_name
  db_instance_address                = module.rds.db_instance_address
  db_instance_username               = module.rds.db_instance_username
  db_instance_name                   = module.rds.db_instance_name
}

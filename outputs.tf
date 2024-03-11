#################################################################
# VPC
#################################################################
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = module.vpc.vpc_cidr
}

output "public-subnet_id" {
  value = module.vpc.public-subnet_id
}

output "private-subnet_id" {
  value = module.vpc.private-subnet_id
}

output "database_subnet_group" {
  value = module.vpc.database_subnet_group
}

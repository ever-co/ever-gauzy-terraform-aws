############ VPC OUTPUT ######################
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "vpc_cidr" {
  value = var.vpc_cidr
}

output "public-subnet_id" {
  value = module.vpc.public_subnets
}

output "private-subnet_id" {
  value = module.vpc.private_subnets
}

output "database_subnet_group" {
  value = module.vpc.database_subnet_group
}

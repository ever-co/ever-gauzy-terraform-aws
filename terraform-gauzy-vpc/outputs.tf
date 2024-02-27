############ VPC OUTPUT ######################
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public-subnet_id" {
  value = module.vpc.public_subnets
}

output "private-subnet_id" {
  value = module.vpc.private_subnets
}

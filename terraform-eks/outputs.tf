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

############ EKS OUTPUT ######################
output "cluster_arn" {
  description = "EKS cluster ARN."
  value       = module.eks.cluster_arn
}

output "cluster_endpoint" {
  description = "Endpoint for EKS control plane."
  value       = module.eks.cluster_endpoint
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}

output "cluster_certificate_authority_data" {
  description = "The certificate data required to communicate with your cluster."
  value       = module.eks.cluster_certificate_authority_data
}

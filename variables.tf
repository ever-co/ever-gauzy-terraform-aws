variable "environment" {
  type        = string
  default     = "demo"
  description = "specify which environment to provision infrastructure"
}

variable "region" {
  type    = string
  default = "us-east-1"
}


#################################################################
# VPC
#################################################################
variable "create_vpc" {
  type        = bool
  default     = true
  description = "Whether to create default VPC or not."
}

#################################################################
# RDS
#################################################################
variable "create_rds" {
  type        = bool
  default     = false
  description = "Whether to create rds or not."
}

#################################################################
# EKS
#################################################################
variable "create_eks" {
  type        = bool
  default     = false
  description = "Whether to create eks or not."
}

variable "cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.28`)"
  type        = string
  default     = "1.28"
}

#################################################################
# HELM
#################################################################
variable "create_helm" {
  type        = bool
  default     = false
  description = "Whether to create eks or not."
}

variable "name" {
  type    = string
  default = "ever-gauzy"
}

variable "h_version" {
  type    = string
  default = "0.1.9"
}

variable "chart" {
  type    = string
  default = "ever-gauzy"
}

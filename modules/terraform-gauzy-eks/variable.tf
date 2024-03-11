variable "environment" {
  default = "ever-gauzy"
}

variable "cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.28`)"
  type        = string
  default     = "1.28"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "private-subnet_id" {
}

variable "vpc_id" { 
}
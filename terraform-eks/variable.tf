variable "environment" {
  default = "ever-gauzy"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  default = ["10.0.0.0/24", "10.0.1.0/24"]
}

variable "private_subnet_cidr" {
  default = ["10.0.2.0/24", "10.0.3.0/24"]
}

variable "cluster_version" {
  description = "Kubernetes `<major>.<minor>` version to use for the EKS cluster (i.e.: `1.28`)"
  type        = string
  default     = "1.29"
}
variable "environment" {
  default = "demo"
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

variable "database_subnet_cidr" {
  default = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "create_vpc" {
  type        = bool
  default     = true
  description = "Whether to create default VPC or not."
}

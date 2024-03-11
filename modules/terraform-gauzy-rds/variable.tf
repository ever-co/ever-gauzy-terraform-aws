variable "environment" {
  default = "demo"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "database_subnet_group" {
  type = string
}

variable "vpc_cidr" {
 type = string 
}

variable "vpc_id" {
  type = string
}
variable "environment" {
  default = "demo"
}

variable "region" {
  type = string
  default = "us-east-1"
}

variable "name" {
  type = string
  default = "ever-gauzy"
}

variable "h_version" {
  type = string
  default = "0.1.9"
}

variable "chart" {
  type = string
  default = "ever-gauzy"
}

variable "external_db" {
}

variable "cluster_endpoint" {
}

variable "cluster_certificate_authority_data" {
}

variable "cluster_name" {
}


variable "db_instance_address" {
}

variable "db_instance_username" {
}

variable "db_instance_name" {
}

variable "api_host" {
}

variable "api_secretName" {
}

variable "web_host" {
}

variable "web_secretName" {
}

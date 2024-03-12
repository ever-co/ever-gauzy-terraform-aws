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

######################### POSTGRES #####################################
variable "engine" {
  type = string
  default = "postgres"
}

variable "engine_version" {
  type = string
  default = "14"
}

variable "family" {
  type = string
  default = "postgres14"
}

variable "major_engine_version" {
  type = string
  default = "14"
}

variable "db_name" {
  type = string
  default = "completePostgresql"
}

variable "username" {
  type = string
  default = "complete_postgresql"
}

variable "port" {
  type = number
  default = 5432
}

variable "password" {
  type = string
  default = "postgres1234"
}

######################### MYSQL #####################################
/* variable "engine" {
  type = string
  default = "mysql"
}

variable "engine_version" {
  type = string
  default = "8.0"
}

variable "family" {
  type = string
  default = "mysql8.0"
}

variable "major_engine_version" {
  type = string
  default = "8.0"
}

variable "db_name" {
  type = string
  default = "completeMySql"
}

variable "username" {
  type = string
  default = "complete_mysql"
}

variable "port" {
  type = number
  default = 3306
}

variable "password" {
  type = string
  default = "mysql1234"
} */

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

variable "api_host" {
  type = string
  default = "apidemo.gauzy.co"
}

variable "api_secretName" {
  type = string
  default = "chart-example-tls"
}

variable "web_host" {
  type = string
  default = "demo.gauzy.co"
}

variable "web_secretName" {
  type = string
  default = "chart-example-tls"
}

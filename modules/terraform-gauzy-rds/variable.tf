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

######################### DB #####################################
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

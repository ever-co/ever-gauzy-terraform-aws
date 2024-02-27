data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  cluster_name = "${var.environment}-eks"
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name                    = "${var.environment}-vpc"
  cidr                    = var.vpc_cidr
  azs                     = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  private_subnets         = var.private_subnet_cidr
  public_subnets          = var.public_subnet_cidr
  enable_nat_gateway      = true
  single_nat_gateway      = false
  enable_dns_hostnames    = true
  map_public_ip_on_launch = true

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/elb"                      = "1"
  }

  private_subnet_tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb"             = "1"
  }
}

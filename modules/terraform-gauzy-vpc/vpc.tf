data "aws_availability_zones" "available" {
  state = "available"
}

locals {
  cluster_name = "${var.environment}-eks"
}

module "vpc" {
  //count   = var.create_vpc ? 1 : 0
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.2"

  name                                   = "${var.environment}-vpc"
  cidr                                   = var.vpc_cidr
  azs                                    = [data.aws_availability_zones.available.names[0], data.aws_availability_zones.available.names[1]]
  private_subnets                        = var.private_subnet_cidr
  public_subnets                         = var.public_subnet_cidr
  database_subnets                       = var.database_subnet_cidr
  enable_nat_gateway                     = true
  single_nat_gateway                     = false
  enable_dns_hostnames                   = true
  map_public_ip_on_launch                = true
  create_database_subnet_group           = true
  create_database_subnet_route_table     = true
  create_database_internet_gateway_route = true

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

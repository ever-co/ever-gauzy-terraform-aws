module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "~> 5.0"

  name        = "${var.environment}-rds-sg"
  description = "Complete DB example security group"
  vpc_id      = var.vpc_id

  # ingress
  ingress_with_cidr_blocks = [
    {
      from_port   = var.port
      to_port     = var.port
      protocol    = "tcp"
      description = "DB access from within VPC"
      cidr_blocks = var.vpc_cidr
    },
  ]

  tags = {
    Name = "${var.environment}-rds-sg"
  }
}

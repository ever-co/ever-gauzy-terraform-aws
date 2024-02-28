locals {
  cluster_name = "${var.environment}-eks"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = local.cluster_name
  cluster_version = var.cluster_version

  cluster_endpoint_public_access = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }
  
  vpc_id                   =  data.terraform_remote_state.vpc.outputs.vpc_id
  subnet_ids               =  data.terraform_remote_state.vpc.outputs.private-subnet_id
  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  }

  eks_managed_node_groups = {
    example = {
      min_size     = 1
      max_size     = 4
      desired_size = 2

      instance_types = ["t3.large"]
      capacity_type  = "SPOT"
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  access_entries = {
    # Adding multiple policies to a single access entry
    ex-multiple = {
      kubernetes_groups = []
      principal_arn     = aws_iam_role.this["multiple"].arn

      policy_associations = {
        ex-one = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSEditPolicy"
          access_scope = {
            namespaces = ["default"]
            type       = "namespace"
          }
        }
        ex-two = {
          policy_arn = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSViewPolicy"
          access_scope = {
            type = "cluster"
          }
        }
      }
    }
  }

  tags = {
    "kubernetes.io/cluster/${local.cluster_name}" = "shared"
  }
}

resource "aws_iam_role" "this" {
  for_each = toset(["single", "multiple"])

  name = "ex-${each.key}"

  # Just using for this example
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "Example"
        Principal = {
          Service = "ec2.amazonaws.com",
        }
      },
    ]
  })
}

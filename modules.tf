module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.2.0"

  name = "eks-sample-vpc"
  cidr = "10.0.0.0/16"

  azs             = var.aws_zones
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
  }
}

module "eks-sample-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.1.0"
  cluster_name    = "eks-sample-cluster"
  cluster_version = "1.17"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  worker_groups = [
    {
      instance_type = "m4.large"
      asg_max_size  = 5
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks-sample-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks-sample-cluster.cluster_id
}
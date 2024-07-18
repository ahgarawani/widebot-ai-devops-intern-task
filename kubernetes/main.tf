module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "web-app-cluster"
  cluster_version = "1.20"
  subnets         = var.subnet_ids
  vpc_id          = var.vpc_id

  node_groups = {
    web_app = {
      desired_capacity = var.asg_desired_capacity
      max_capacity     = var.asg_max_capacity
      min_capacity     = var.asg_min_capacity
      instance_type    = var.instance_type
      security_groups  = [var.web_app_sg_id]
    }
  }
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.main.token
}

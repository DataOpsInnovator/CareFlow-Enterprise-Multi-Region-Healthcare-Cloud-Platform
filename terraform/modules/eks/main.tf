module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "21.24.2"
  name               = var.name
  kubernetes_version = var.kubernetes_version
  endpoint_public_access  = false
  endpoint_private_access = true
  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids
  enable_irsa = false
  authentication_mode = "API_AND_CONFIG_MAP"
  enable_cluster_creator_admin_permissions = false
  encryption_config = { provider_key_arn = var.kms_key_arn, resources = ["secrets"] }
  addons = {
    coredns = { most_recent = true }
    kube-proxy = { most_recent = true }
    vpc-cni = { most_recent = true; before_compute = true }
    eks-pod-identity-agent = { most_recent = true; before_compute = true }
  }
  eks_managed_node_groups = {
    system = {
      instance_types = var.system_instance_types
      min_size = 2; desired_size = 3; max_size = 6
      capacity_type = "ON_DEMAND"
      labels = { workload = "system" }
      taints = { CriticalAddonsOnly = { key="CriticalAddonsOnly", value="true", effect="NO_SCHEDULE" } }
    }
  }
  access_entries = var.access_entries
  tags = var.tags
}

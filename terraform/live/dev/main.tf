module "vpc" {
  source = "../../modules/vpc"

  name               = "${var.project_name}-${var.environment}"
  cidr               = var.vpc_cidr
  availability_zones = var.availability_zones
}

# Add EKS, data, queues, KMS, and observability modules incrementally.
# The portfolio intentionally avoids creating expensive resources by default.

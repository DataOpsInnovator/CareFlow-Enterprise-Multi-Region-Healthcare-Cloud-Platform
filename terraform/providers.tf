provider "aws" {
  region = var.aws_region

  default_tags {
    tags = {
      Project     = "careflow"
      Environment = var.environment
      ManagedBy   = "terraform"
      Portfolio   = "true"
    }
  }
}

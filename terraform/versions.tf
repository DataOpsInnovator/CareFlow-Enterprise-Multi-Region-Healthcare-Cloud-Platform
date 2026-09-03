terraform {
  required_version = ">= 1.9.0, < 2.0.0"
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 6.62" }
    random = { source = "hashicorp/random", version = "~> 3.7" }
    tls = { source = "hashicorp/tls", version = "~> 4.1" }
  }
}

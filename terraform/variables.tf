variable "aws_region" {
  description = "AWS region for the portfolio environment."
  type        = string
}

variable "environment" {
  description = "Environment name."
  type        = string
  default     = "dev"
}

variable "project_name" {
  type    = string
  default = "careflow"
}

variable "aws_region" {
  type = string
}

variable "environment" {
  type    = string
  default = "dev"
}

variable "project_name" {
  type    = string
  default = "careflow"
}

variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}

variable "availability_zones" {
  type = list(string)
}

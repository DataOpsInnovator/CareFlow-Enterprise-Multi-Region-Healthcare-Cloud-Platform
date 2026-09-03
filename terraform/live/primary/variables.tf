variable "environment" { type=string; default="prod" }
variable "region_short" { type=string }
variable "vpc_cidr" { type=string }
variable "azs" { type=list(string) }
variable "private_subnets" { type=list(string) }
variable "public_subnets" { type=list(string) }
variable "database_subnets" { type=list(string) }
variable "clinical_data_bucket" { type=string }
variable "eks_access_entries" { type=any; default={} }
variable "tags" { type=map(string); default={} }

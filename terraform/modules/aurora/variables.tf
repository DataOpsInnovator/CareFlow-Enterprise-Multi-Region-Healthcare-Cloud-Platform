variable "name" { type=string }
variable "vpc_id" { type=string }
variable "client_cidr" { type=string }
variable "db_subnet_group_name" { type=string }
variable "kms_key_arn" { type=string }
variable "database_name" { type=string; default="careflow" }
variable "master_username" { type=string; default="platformadmin" }
variable "instance_class" { type=string; default="db.r7g.large" }
variable "tags" { type=map(string); default={} }

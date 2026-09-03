variable "name" { type = string }
variable "kubernetes_version" { type = string; default = "1.34" }
variable "vpc_id" { type = string }
variable "subnet_ids" { type = list(string) }
variable "kms_key_arn" { type = string }
variable "system_instance_types" { type = list(string); default = ["m7i.large"] }
variable "access_entries" { type = any; default = {} }
variable "tags" { type = map(string); default = {} }

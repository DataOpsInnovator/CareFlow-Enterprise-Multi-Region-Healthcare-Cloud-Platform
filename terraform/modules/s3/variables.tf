variable "name" { type=string }
variable "kms_key_arn" { type=string }
variable "object_lock" { type=bool; default=false }
variable "tags" { type=map(string); default={} }

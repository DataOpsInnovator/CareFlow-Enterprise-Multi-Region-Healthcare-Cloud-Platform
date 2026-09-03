variable "name" { type=string }
variable "kms_key_arn" { type=string }
variable "visibility_timeout" { type=number; default=60 }
variable "tags" { type=map(string); default={} }

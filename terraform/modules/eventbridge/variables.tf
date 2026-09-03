variable "name" { type=string }
variable "target_queue_arn" { type=string }
variable "tags" { type=map(string); default={} }

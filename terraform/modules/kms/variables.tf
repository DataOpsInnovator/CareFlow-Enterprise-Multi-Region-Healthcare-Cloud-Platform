variable "name" { type = string }
variable "description" { type = string; default = "CareFlow platform key" }
variable "multi_region" { type = bool; default = false }
variable "tags" { type = map(string); default = {} }

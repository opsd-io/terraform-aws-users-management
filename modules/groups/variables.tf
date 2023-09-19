variable "name" {
  description = "IAM Group name"
  type        = string
}

variable "path" {
  description = "Path in which to create AIM Group"
  type        = string
  nullable    = true
}

variable "roles" {
  description = "Roles accessible to this group"
  type        = list(string)
  default     = []
}

variable "role_dict" {
  description = "Dictionary of roles and policies for assuming them"
  type        = map(string)
  nullable    = true
}

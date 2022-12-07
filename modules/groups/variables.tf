# variable "path" {
#   description = "Path in which to create AIM Group"
#   type        = string
#   default     = null
# }

# variable "roles" {
#   description = "Roles accessible to this group"
#   type        = list(string)
#   default     = []
# }

variable "name" {
  description = "IAM Group name"
  type        = string
}

variable "options" {
  description = "List of IAM Group paths and roles"
  type = object({
    path  = optional(string)
    roles = optional(list(string), [])
  })
}

variable "role_dict" {
  description = "Dictionary of roles and policies for assuming them"
  type        = map(string)
  nullable    = true
}

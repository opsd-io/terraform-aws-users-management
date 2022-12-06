# variable "assume_role_policy" {
#   description = "Police that grants an entitiy permission to assume the role"
#   type        = any
#   default = object({
#     Version = formatdate("YYYY-MM-DD", timestamp())
#     Statement = [{
#       Action    = "sts:AssumeRole"
#       Effect    = "Allow"
#       Principal = { AWS = "arn:aws:iam::*:root" }
#     }]
#   })
# }

# variable "description" {
#   description = "Description of the role"
#   type        = string
#   default     = null
# }

# variable "policies" {
#   description = "List of policy names or arns for a given role"
#   type        = list(string)
# }

# variable "tags" {
#   description = "Map of resource tags for the role"
#   type        = map(any)
#   default     = null
# }

variable "arn_dict" {
  description = "Dictionary of policy names and arns"
  type        = map(string)
  nullable    = true
}

variable "data" {
  description = "Object with AIM policy attributes"
  type = object({
    assume_role_policy = optional(any)
    description        = optional(string)
    policies           = optional(list(string), [])
    tags               = optional(map(string))
  })
}

variable "name" {
  description = "AIM role name"
  type        = string
}

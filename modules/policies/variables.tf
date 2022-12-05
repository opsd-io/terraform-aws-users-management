# variable "description" {
#   description = "Description of IAM policy"
#   type        = string
#   default     = null
# }

# variable "name" {
#   description = "Name of AIM policy"
#   type        = string
# }

# variable "path" {
#   description = "Path in which to create AIM policy"
#   type        = string
#   default     = null
# }

# variable "policy" {
#   description = "JSON formatted string with the policy document"
#   type        = any
# }

# variable "tags" {
#   description = "Map of resource tags for the IAM Policy"
#   type        = map(any)
#   default     = null
# }

variable "data" {
  description = "Object with AIM policy attributes"
  type = object({
    description = optional(string)
    name        = string
    path        = optional(string)
    policy      = any
    tags        = optional(map(any))
  })
}

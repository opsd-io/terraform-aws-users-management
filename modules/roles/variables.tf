variable "allowed_principals" {
  description = "object with allowed principals that grant permission to assume the role"
  type = object({
    AWS     = optional(set(string), [])
    Service = optional(set(string), [])
  })
}

variable "description" {
  description = "Description of the role"
  type        = string
  nullable    = true
}

variable "name" {
  description = "AIM role name"
  type        = string
}

variable "policies" {
  description = "List of policy names or arns for a given role"
  type        = list(string)
  default     = []
}

variable "tags" {
  description = "Map of resource tags for the role"
  type        = map(any)
  nullable    = true
}

variable "policy_dict" {
  description = "Dictionary of policy names and arns"
  type        = map(string)
  default     = {}
}

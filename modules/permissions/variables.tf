variable "policies" {
  description = "List of IAM Policies"
  type = list(object({
    name        = optional(string)
    path        = optional(string)
    description = optional(string)
    tags        = optional(map(string))
    policy      = any
  }))
}

variable "users" {
  description = "List of objects containing users name and all other user related attributes"
  type = list(object({
    name     = string
    policies = optional(list(string))
  }))
}

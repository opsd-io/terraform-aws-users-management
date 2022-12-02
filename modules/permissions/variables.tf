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

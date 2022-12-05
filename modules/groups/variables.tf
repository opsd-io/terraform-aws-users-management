variable "groups" {
  description = "List of IAM Groups, their paths and users"
  type = list(object({
    name     = string
    path     = optional(string)
    policies = optional(list(string))
    users    = optional(list(string))
  }))
}

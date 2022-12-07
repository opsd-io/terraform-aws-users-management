variable "name" {
  description = "AWS IAM user name"
  type        = string
}

variable "options" {
  description = "Object containing user groups, path, roles, tags and ssh_keys"
  type = object({
    groups = optional(list(string), [])
    path   = optional(string)
    roles  = optional(list(string), [])
    tags   = optional(map(string))
    ssh_keys = optional(list(object({
      encoding   = optional(string, "SSH")
      public_key = string
      status     = optional(string, "Active")
    })), [])
  })
}

variable "role_dict" {
  description = "Dictionary of roles and policies for assuming them"
  type        = map(string)
  nullable    = true
}

variable "name" {
  description = "AWS IAM user name"
  type        = string
}

variable "groups" {
  description = "list of AWS IAM groups to which user belongs"
  type        = list(string)
  default     = []
}

variable "path" {
  description = "Path in which to create AWS IAM user"
  type        = string
  nullable    = true
}

variable "roles" {
  description = "List of AWS IAM roles that user can assume. You can specifie them by role name, if you declared them in tfvars, or, if its a build in role or any other, you should use arn of the policy that enables assuming this role"
  type        = list(string)
  default     = []
}

variable "role_dict" {
  description = "Dictionary of roles and policies for assuming them"
  type        = map(string)
  nullable    = true
}

variable "tags" {
  description = "Map of tags for user"
  type        = map(string)
  nullable    = true
}

variable "ssh_keys" {
  description = "List of ssh public keys for user. To define an ssh key you need to create an object with public_key. Optionally you can also specify encoding you use (PEM or SSH) and if the key is Active or Inactive"
  type = list(object({
    encoding   = optional(string, "SSH")
    public_key = string
    status     = optional(string, "Active")
  }))
  default = []
}

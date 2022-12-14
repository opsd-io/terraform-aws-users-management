variable "assume_role_policy" {
  description = "Police that grants an entitiy permission to assume the role"
  type        = any
  nullable    = true
  # default = object({
  #   Version = formatdate("YYYY-MM-DD", timestamp())
  #   Statement = [{
  #     Action    = "sts:AssumeRole"
  #     Effect    = "Allow"
  #     Principal = { AWS = "arn:aws:iam::*:root" }
  #   }]
  # })
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
}

variable "tags" {
  description = "Map of resource tags for the role"
  type        = map(any)
  nullable    = true
}

variable "policy_dict" {
  description = "Dictionary of policy names and arns"
  type        = map(string)
  nullable    = true
}

variable "description" {
  description = "Description of IAM policy"
  type        = string
  nullable    = true
}

variable "name" {
  description = "Name of AIM policy"
  type        = string
}

variable "path" {
  description = "Path in which to create AIM policy"
  type        = string
  nullable    = true
}

variable "policy" {
  description = "JSON formatted string with the policy document"
  type        = any
}

variable "tags" {
  description = "Map of resource tags for the IAM Policy"
  type        = map(any)
  nullable    = true
}

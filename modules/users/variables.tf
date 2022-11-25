variable "iam_user_name" {
  description = "AWS IAM user name"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z\\+\\=\\,\\.\\@\\-\\_0-9]{1,64}$", var.iam_user_name))
    error_message = "User names can be a combination of up to 64 letters, digits, and these characters: plus (+), equal (=), comma (,), period (.), at sign (@), underscore (_), and hyphen (-)."
  }
}

variable "iam_user_path" {
  description = "Path in which to create the AWS IAM user."
  type        = string
  default     = "/"
}

variable "iam_user_tags" {
  description = "Tags assign to this resource."
  type        = map(string)
  default     = {}
}

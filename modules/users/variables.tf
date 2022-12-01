variable "user_name" {
  description = "AWS IAM user name"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z\\+\\=\\,\\.\\@\\-\\_0-9]{1,64}$", var.user_name))
    error_message = "User names can be a combination of up to 64 letters, digits, and these characters: plus (+), equal (=), comma (,), period (.), at sign (@), underscore (_), and hyphen (-)."
  }
}

variable "user_path" {
  description = "Path in which to create the AWS IAM user."
  type        = string
  default     = "/"
}

variable "user_tags" {
  description = "Tags assign to this resource."
  type        = map(string)
  default     = {}

  # tag key must be a minimum of 1 and a maximum of 128 Unicode characters in UTF-8.
  # tag value must be a minimum of 0 and a maximum of 256 Unicode characters in UTF-8.
  # validation {
  #   condition     = can(regex("^[a-zA-Z\\+\\=\\,\\.\\@\\-\\_0-9]{1,128}$", var.user_tags))
  #   error_message = "The allowed characters are letters, numbers, spaces representable in UTF-8, and the following characters: underscore (_), dot(.), colon(:), slash (/), equal (=), plus (+), hyphen (-) and at sign (@)."
  # }
}

variable "ssh_keys" {
  description = "List of objects containing: key encoding format (SSH/PEM), ssh key itself, status of the key (Active/Inactive)"
  type = list(object({
    key = string
  }))
}

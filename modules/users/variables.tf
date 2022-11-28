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

  # tag key must be a minimum of 1 and a maximum of 128 Unicode characters in UTF-8.
  # tag value must be a minimum of 0 and a maximum of 256 Unicode characters in UTF-8.
  # validation {
  #   condition     = can(regex("^[a-zA-Z\\+\\=\\,\\.\\@\\-\\_0-9]{1,128}$", var.iam_user_tags))
  #   error_message = "The allowed characters are letters, numbers, spaces representable in UTF-8, and the following characters: underscore (_), dot(.), colon(:), slash (/), equal (=), plus (+), hyphen (-) and at sign (@)."
  # }
}

variable "iam_user_ssh_key_encoding" {
  description = "Specifies the public key encoding format to use in the response."
  type        = string
  default     = "SSH" # Avaliable options: SSH and PEM
}

variable "iam_user_ssh_public_key" {
  description = "Unique identifier for the SSH public key."
  type        = string
  default     = ""
}

variable "iam_user_ssh_key_status" {
  description = "Status of the SSH/PEM public key"
  type        = string
  default     = "Active" # Avaliable options: Active and Inactive
}

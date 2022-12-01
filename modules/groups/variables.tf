variable "create_group" {
  description = "Wheter to create IAM group"
  type        = bool
  default     = true
}

variable "group_name" {
  description = "Name of an IAM group"
  type        = string

  validation {
    condition     = can(regex("^[a-zA-Z\\+\\=\\,\\.\\@\\-\\_0-9]{1,128}$", var.group_name))
    error_message = "Group names can be a combination of up to 128 letters, digits, and these characters: plus (+), equal (=), comma (,), period (.), at sign (@), underscore (_), and hyphen (-). Names must be unique within an account and they are not distinguished by case."
  }
}

variable "group_path" {
    description = "Path of an IAM group"
    type = string
    default = "/"
    
    validation {
      condition = can(regex("^(\u002F)|(\u002F[\u0021-\u007F]+\u002F){1,512}$", var.group_path))
      error_message = "Paths consists of either a forward slash (/) by itself or a string that must begin and end with forward slashes."
    }  
}

variable "group_users" {
  description = "List of IAM users in this group"
  type        = list(string)
  default     = []
}

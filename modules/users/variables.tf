variable "users" {
  description = "List of objects containing users name and all other user related attributes"

  type = list(object({
    name = string
    path = optional(string)
    tags = optional(map(string))
    ssh_keys = list(object({
      key = string
      key_encoding = optional(string)
      key_status = optional(string)
    }))
  }))
}

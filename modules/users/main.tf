locals {
  key_defaults = {
    key_encoding = "SSH"
    key_status   = "Active"
  }
  final_ssh_keys = {
    for k, v in var.ssh_keys :
    k => merge(local.key_defaults, v)
  }
}

resource "aws_iam_user" "main" {
  name = var.user_name
  path = var.user_path
  tags = var.user_tags
}

resource "aws_iam_user_ssh_key" "main" {
  count = length(local.final_ssh_keys)

  username   = aws_iam_user.main.name
  public_key = local.final_ssh_keys[count.index].key
  encoding   = local.final_ssh_keys[count.index].key_encoding
  status     = local.final_ssh_keys[count.index].key_status
}

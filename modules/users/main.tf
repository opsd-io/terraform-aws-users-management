locals {
  ssh_keys = flatten([
    for user in var.users : [
      for ssh_key in user.ssh_keys == null ? [] : user.ssh_keys : {
        username   = user.name
        public_key = ssh_key.key
        encoding   = ssh_key.key_encoding == null ? "SSH" : ssh_key.key_encoding
        status     = ssh_key.key_status == null ? "Active" : ssh_key.key_status
      }
    ]
  ])
}

resource "aws_iam_user" "main" {
  for_each = { for k, v in var.users : k => v }

  name = each.value.name
  path = each.value.path == null ? "/" : each.value.path
  tags = each.value.tags == null ? {} : each.value.tags
}

resource "aws_iam_user_ssh_key" "main" {
  for_each = { for k, v in local.ssh_keys : k => v }

  username   = each.value.username
  public_key = each.value.public_key
  encoding   = each.value.encoding
  status     = each.value.status
}

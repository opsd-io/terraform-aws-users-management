locals {
  roles = [
    for name in var.roles :
    lookup(var.role_dict, name, name)
  ]
}

# user creation
resource "aws_iam_user" "main" {
  name = var.name
  path = var.path
  tags = var.tags
}

# adding ssh_keys to user
resource "aws_iam_user_ssh_key" "main" {
  for_each = { for k, v in var.ssh_keys : k => v if v.public_key != null }

  encoding   = each.value.encoding
  public_key = each.value.public_key
  status     = each.value.status
  username   = aws_iam_user.main.name
}

# assigning roles to user
resource "aws_iam_user_policy_attachment" "main" {
  for_each = { for k, v in local.roles : k => v }

  user       = aws_iam_user.main.name
  policy_arn = each.value
}

# adding user to groups
resource "aws_iam_user_group_membership" "main" {
  user   = aws_iam_user.main.name
  groups = var.groups
}

# setting temporary password for new user
resource "aws_iam_user_login_profile" "main" {
  user = aws_iam_user.main.name
}

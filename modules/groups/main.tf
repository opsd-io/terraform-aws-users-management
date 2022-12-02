resource "aws_iam_group" "main" {
  for_each = { for k, v in var.groups : k => v }

  name = each.value.name
  path = each.value.path
}

resource "aws_iam_group_membership" "main" {
  for_each = { for k, v in var.groups : k => v if v.users != null }

  group = each.value.name
  name  = each.value.name
  users = each.value.users
}

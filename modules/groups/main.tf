locals {
  group_id = var.create_group ? aws_iam_group.main[0].id : var.group_name
}

resource "aws_iam_group" "main" {
  count = var.create_group ? 1 : 0

  name = var.group_name
  path = var.group_path
}

resource "aws_iam_group_membership" "main" {
  count = length(var.group_users) > 0 ? 1 : 0

  group = local.group_id
  name  = var.group_name
  users = var.group_users
}

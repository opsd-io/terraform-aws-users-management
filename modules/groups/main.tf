locals {
  roles = [
    for name in var.options.roles :
    lookup(var.role_dict, name, name)
  ]
}

resource "aws_iam_group" "main" {
  name = var.name
  path = var.options.path
}

resource "aws_iam_group_policy_attachment" "main" {
  for_each = { for k, v in local.roles : k => v }

  group      = aws_iam_group.main.name
  policy_arn = each.value
}

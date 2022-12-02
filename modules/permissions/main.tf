resource "aws_iam_policy" "main" {
  for_each = { for k, v in var.policies : k => v }

  name        = each.value.name
  path        = each.value.path
  description = each.value.description
  tags        = each.value.tags
  policy      = jsonencode(each.value.policy)
}

resource "aws_iam_user_policy_attachment" "main" {
  for_each = { for k, v in var.users : k => v if can(k.value.policies) }

  user       = each.value.name
  policy_arn = each.value.policies[*]
}

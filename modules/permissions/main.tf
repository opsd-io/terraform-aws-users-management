resource "aws_iam_policy" "main" {
  for_each = { for k, v in var.policies : k => v }

  name        = each.value.name
  path        = each.value.path
  description = each.value.description
  tags        = each.value.tags
  policy      = jsonencode(each.value.policy)
}

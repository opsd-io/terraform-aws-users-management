locals {
  policies = flatten([
    for group in var.groups : [
      for policy in group.policies == null ? [] : group.policies : {
        group      = group.name
        policy_arn = policy
      }
    ]
  ])
}

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

resource "aws_iam_group_policy_attachment" "main" {
  for_each = { for k, v in local.policies : k => v }

  group      = each.value.group
  policy_arn = each.value.policy_arn
}

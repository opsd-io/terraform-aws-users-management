data "aws_caller_identity" "current" {}

resource "aws_iam_group" "main" {
  name = var.name
  path = var.options.path
}

resource "aws_iam_policy" "main" {
  for_each = { for k, v in var.options.roles : k => v }

  description = "Policy that assigns group to a role"
  name        = "${aws_iam_group.main.name}-${each.value}-assign"
  path        = var.options.path
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = "iam:AttachRolePolicy"
        Resource = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${each.value}"
      }
    ]
  })
}

resource "aws_iam_group_policy_attachment" "main" {
  depends_on = [aws_iam_policy.main]
  for_each   = aws_iam_policy.main

  group      = aws_iam_group.main.name
  policy_arn = each.value.arn
}

data "aws_caller_identity" "current" {}

# user creation
resource "aws_iam_user" "main" {
  name = var.name
  path = var.options.path
  tags = var.options.tags
}

# adding ssh_keys to user
resource "aws_iam_user_ssh_key" "main" {
  for_each = { for k, v in var.options.ssh_keys : k => v if v.public_key != null }

  encoding   = each.value.encoding
  public_key = each.value.public_key
  status     = each.value.status
  username   = var.name
}

# assigning roles to user
resource "aws_iam_policy" "main" {
  for_each = { for k, v in var.options.roles : k => v }

  description = "Policy that assigns user to a role"
  name        = "${aws_iam_user.main.name}-${each.value}-assign"
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
resource "aws_iam_user_policy_attachment" "main" {
  depends_on = [aws_iam_policy.main]
  for_each   = aws_iam_policy.main

  user       = aws_iam_user.main.name
  policy_arn = each.value.arn
}

# adding user to groups
resource "aws_iam_user_group_membership" "main" {
  user   = aws_iam_user.main.name
  groups = var.options.groups
}

# TODO setting temporary password for new user

data "aws_caller_identity" "current" {}

locals {
  assume_role_policy = jsonencode(var.options.assume_role_policy != null ? var.options.assume_role_policy : {
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" }
    }]
  })
  policies = [
    for name in var.options.policies :
    lookup(var.policy_dict, name, name)
  ]
}

resource "aws_iam_role" "main" {
  force_detach_policies = true

  assume_role_policy = local.assume_role_policy
  description        = var.options.description
  name               = var.name
  tags               = var.options.tags
}

resource "aws_iam_role_policy_attachment" "main" {
  for_each = { for k, v in local.policies : k => v }

  role       = aws_iam_role.main.name
  policy_arn = each.value
}

# permission for entities to assume role
resource "aws_iam_policy" "assume_role" {
  description = "Policy for assuming ${var.name} role"
  name        = "assume-${var.name}"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = "sts:AssumeRole"
      Resource = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.main.name}*"
    }]
  })
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]
    dynamic "principals" {
      for_each = var.allowed_principals
      content {
        type        = principals.key
        identifiers = principals.value
      }
    }
  }
}

locals {
  policies = {
    for name in var.policies :
    name => lookup(var.policy_dict, name, name)
  }
}

resource "aws_iam_role" "main" {
  force_detach_policies = true

  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  description        = var.description
  name               = var.name
  tags               = var.tags
}

resource "aws_iam_role_policy_attachment" "main" {
  for_each = local.policies

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

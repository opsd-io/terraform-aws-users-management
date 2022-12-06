data "aws_caller_identity" "current" {}

locals {
  assume_role_policy = jsonencode(var.data.assume_role_policy != null ? var.data.assume_role_policy : {
    Version = "2012-10-17",
    Statement = [{
      Action    = "sts:AssumeRole"
      Effect    = "Allow"
      Principal = { AWS = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root" }
    }]
  })
  policies = [
    for name in var.data.policies :
    lookup(var.arn_dict, name, name)
  ]
}

resource "aws_iam_role" "main" {
  force_detach_policies = true

  assume_role_policy = local.assume_role_policy
  description        = var.data.description
  name               = var.name
  tags               = var.data.tags
}

resource "aws_iam_role_policy_attachment" "main" {
  for_each = { for k, v in local.policies : k => v }

  role       = aws_iam_role.main.name
  policy_arn = each.value
}

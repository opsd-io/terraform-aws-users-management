resource "aws_iam_policy" "main" {
  description = var.description
  name        = var.name
  path        = var.path
  policy      = jsonencode(var.policy)
  tags        = var.tags
}

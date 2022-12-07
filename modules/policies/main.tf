resource "aws_iam_policy" "main" {
  description = var.options.description
  name        = var.name
  path        = var.options.path
  policy      = jsonencode(var.options.policy)
  tags        = var.options.tags
}

resource "aws_iam_policy" "main" {
  description = var.data.description
  name        = var.data.name
  path        = var.data.path
  policy      = jsonencode(var.data.policy)
  tags        = var.data.tags
}

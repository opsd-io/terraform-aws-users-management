resource "aws_iam_user" "main" {
  name = var.iam_user_name
  path = var.iam_user_path
  tags = var.iam_user_tags
}

resource "aws_iam_user_ssh_key" "main" {
  username   = aws_iam_user.main.name
  encoding   = var.iam_user_ssh_key_encoding
  public_key = var.iam_user_ssh_public_key
  status     = var.iam_user_ssh_key_status
}

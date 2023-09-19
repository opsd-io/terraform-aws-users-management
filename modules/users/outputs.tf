output "user_arn" {
  description = "IAM user arn"
  value       = aws_iam_user.main.arn
}

output "user_id" {
  description = "IAM user id"
  value       = aws_iam_user.main.id
}

output "user_unique_id" {
  description = "IAM user unique id"
  value       = aws_iam_user.main.unique_id
}

output "user_password" {
  description = "IAM user unique id"
  value       = aws_iam_user_login_profile.main.password
}

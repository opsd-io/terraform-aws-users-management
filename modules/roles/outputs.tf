output "role_arn" {
  description = "IAM Role arn"
  value       = { (aws_iam_role.main.name) = aws_iam_role.main.arn }
}

output "role_id" {
  description = "IAM Role id"
  value       = { (aws_iam_role.main.name) = aws_iam_role.main.id }
}

output "role_unique_id" {
  description = "IAM Role unique id"
  value       = { (aws_iam_role.main.name) = aws_iam_role.main.unique_id }
}

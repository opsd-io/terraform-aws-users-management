output "role_arn" {
  description = "IAM Role arn"
  value       = aws_iam_role.main.arn
}

output "role_id" {
  description = "IAM Role id"
  value       = aws_iam_role.main.id
}

output "role_unique_id" {
  description = "IAM Role unique id"
  value       = aws_iam_role.main.unique_id
}

output "assume_role_policy" {
  description = "Name of the IAM role and the arn of policy that allows assuming the role"
  value       = aws_iam_policy.assume_role.arn
}

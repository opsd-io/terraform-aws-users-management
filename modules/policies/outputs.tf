output "policy_arn" {
  description = "IAM Policy arn"
  value       = aws_iam_policy.main.arn
}

output "policy_id" {
  description = "IAM Policy id"
  value       = aws_iam_policy.main.id
}

output "policy_policy_id" {
  description = "IAM Policy policy id"
  value       = aws_iam_policy.main.policy_id
}

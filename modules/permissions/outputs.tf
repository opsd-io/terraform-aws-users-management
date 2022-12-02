output "policy_arns" {
  description = "List of IAM Policy arns"
  value = [
    for policy in aws_iam_policy.main : policy.arn
  ]
}

output "policy_ids" {
  description = "List of IAM Policy ids"
  value = [
    for policy in aws_iam_policy.main : policy.id
  ]
}

output "policy_policy_ids" {
  description = "List of IAM Policy policy ids"
  value = [
    for policy in aws_iam_policy.main : policy.policy_id
  ]
}

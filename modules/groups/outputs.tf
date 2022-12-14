output "group_arn" {
  description = "IAM group arn"
  value       = aws_iam_group.main.arn
}

output "group_id" {
  description = "IAM group id"
  value       = aws_iam_group.main.id
}

output "group_unique_id" {
  description = "IAM group unique id"
  value       = aws_iam_group.main.unique_id
}

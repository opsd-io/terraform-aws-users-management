output "group_id" {
  description = "IAM groups id"
  value = [
    for group in aws_iam_group.main : group.id
  ]
}

output "group_arn" {
  description = "IAM groups arn"
  value = [
    for group in aws_iam_group.main : group.arn
  ]
}

output "group_unique_id" {
  description = "IAM groups unique id"
  value = [
    for group in aws_iam_group.main : group.unique_id
  ]
}

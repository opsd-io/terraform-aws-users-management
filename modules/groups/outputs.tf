output "group_id" {
    description = "IAM group id"
    value = aws_iam_group.main[0].id
}

output "group_arn" {
    description = "IAM group arn"
    value = aws_iam_group.main[0].arn
}

output "group_unique_id" {
    description = "IAM group unique id"
    value = aws_iam_group.main[0].unique_id
}

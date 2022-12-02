output "ssh_keys" {
  description = "List of ssh_key objects, each containing public key, its owner and its encoding"
  value       = local.ssh_keys
}

output "user_arns" {
  description = "List of arns"
  value = [
    for user in aws_iam_user.main : user.arn
  ]
}

output "user_ids" {
  description = "List of user IDs"
  value = [
    for user in aws_iam_user.main : user.id
  ]
}

output "user_unique_ids" {
  description = "List of user unique IDs"
  value = [
    for user in aws_iam_user.main : user.unique_id
  ]
}

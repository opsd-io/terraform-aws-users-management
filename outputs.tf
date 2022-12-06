# output "variable" {
#   description = "output variable description"
#   value       = variable.main.name
# }

output "policy_arns" {
  description = "Dictionary of policy names and their arns"
  value       = merge([for policy in module.policies : policy.policy_arn]...)
}

# output "variable" {
#   description = "output variable description"
#   value       = variable.main.name
# }

output "policy_arns" {
  description = "List of policy names and their names"
  value       = [for policy in module.policies : policy.policy_arn]
}

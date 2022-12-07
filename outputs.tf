# output "variable" {
#   description = "output variable description"
#   value       = variable.main.name
# }

output "users_and_passwords" {
  description = "dictionary of users and their passwords"
  value       = merge([for user in module.users : user.user_password]...)
}

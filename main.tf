# Terraform code goes here
locals {
  policy_dict = merge([for policy in module.policies : policy.policy_arn]...)
  role_dict   = merge([for role in module.roles : role.assume_role_policy]...)
}

module "policies" {
  source   = "./modules/policies"
  for_each = var.policies

  name    = each.key
  options = each.value
}

module "roles" {
  source     = "./modules/roles"
  depends_on = [module.policies]
  for_each   = var.roles

  name        = each.key
  options     = each.value
  policy_dict = local.policy_dict
}

module "groups" {
  source     = "./modules/groups"
  depends_on = [module.roles]
  for_each   = var.groups

  name      = each.key
  options   = each.value
  role_dict = local.role_dict
}

module "users" {
  source     = "./modules/users"
  depends_on = [module.groups]
  for_each   = var.users

  name      = each.key
  options   = each.value
  role_dict = local.role_dict
}

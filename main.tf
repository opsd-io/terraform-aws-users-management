# Terraform code goes here
locals {
  arn_dict = merge([for policy in module.policies : policy.policy_arn]...)
}

module "policies" {
  source   = "./modules/policies"
  for_each = var.policies

  data = each.value
  name = each.key
}

module "roles" {
  source     = "./modules/roles"
  depends_on = [module.policies]
  for_each   = var.roles

  arn_dict = local.arn_dict
  data     = each.value
  name     = each.key
}

module "groups" {
  source     = "./modules/groups"
  depends_on = [module.roles]
  for_each   = var.groups

  name    = each.key
  options = each.value
}

module "users" {
  source     = "./modules/users"
  depends_on = [module.groups]
  for_each   = var.users

  name    = each.key
  options = each.value
}

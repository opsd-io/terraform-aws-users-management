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

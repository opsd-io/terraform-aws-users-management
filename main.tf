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

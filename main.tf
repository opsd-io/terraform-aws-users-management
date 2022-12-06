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

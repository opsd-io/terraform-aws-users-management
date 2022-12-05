# Terraform code goes here

module "policies" {
  source   = "./modules/policies"
  for_each = { for k, v in var.policies : k => v }
  data     = each.value
}

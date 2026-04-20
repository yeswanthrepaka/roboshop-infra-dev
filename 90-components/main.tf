module "components" {
    for_each = var.component
  source = "git::https://github.com/yeswanthrepaka/terraform-aws-component.git?ref=main"
  component = each.key
  rule_priority = each.value
}
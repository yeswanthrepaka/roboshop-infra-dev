module "vpc" {
  source = "../../terraform-aws-vpc"
  cidr_block = var.cidr_block
  project = var.project
  env = var.env
  is_peering_required = true
}

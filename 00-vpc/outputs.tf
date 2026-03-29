output "vpc_id" {
  value = module.vpc.vpc_id_output
}

output "public_id" {
  value = module.vpc.public_subnets
}

output "private_id" {
  value = module.vpc.private_subnets
}

output "database_id" {
  value = module.vpc.database_subnets
}
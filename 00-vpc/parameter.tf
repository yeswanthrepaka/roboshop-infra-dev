resource "aws_ssm_parameter" "vpc" {
  name  = "/${var.project}/${var.env}/vpc_id"
  type  = "String"
  value = module.vpc.vpc_id_output
}
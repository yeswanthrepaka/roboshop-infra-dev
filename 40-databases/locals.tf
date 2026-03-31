locals {
  ami_id = data.aws_ami.ami.id
  mongodb_sg_id = data.aws_ssm_parameter.mongodb.value
  database_subnet_id = data.aws_ssm_parameter.database.value
  common_tags = {
    Project = var.project
    Environment = var.env
    Terraform = "true"
  }
}
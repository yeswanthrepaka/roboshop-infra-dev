data "aws_ami" "ami" {
  most_recent = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
    
  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

data "aws_ssm_parameter" "mongodb" {
  name = "/${var.project}/${var.env}/mongodb_sg_id"
}

data "aws_ssm_parameter" "database_subnet_ids" {
  name = "/${var.project}/${var.env}/database_subnet_ids"
}

data "aws_ssm_parameter" "redis" {
  name = "/${var.project}/${var.env}/redis_sd_id"
}

data "aws_ssm_parameter" "mysql" {
  name = "/${var.project}/${var.env}/mysql_sd_id"
}

data "aws_ssm_parameter" "rabbitmq" {
  name = "/${var.project}/${var.env}/rabbitmq_sd_id"
}
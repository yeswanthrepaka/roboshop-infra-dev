locals {
  ami_id = data.aws_ami.ami.id
  mongodb_sg_id = data.aws_ssm_parameter.mongodb.value
  redis_sd_id = data.aws_ssm_parameter.redis.value
  mysql_sd_id = data.aws_ssm_parameter.mysql.value
  rabbitmq_sd_id = data.aws_ssm_parameter.rabbitmq.value
  database_subnet_id = split(",", data.aws_ssm_parameter.database_subnet_ids.value)[0]
  common_tags = {
    Project = var.project
    Environment = var.env
    Terraform = "true"
  }
}
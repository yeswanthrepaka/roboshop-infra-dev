data "aws_ssm_parameter" "bastion" {
  name = "/${var.project}/${var.env}/bastion_sg_id"
}

data "aws_ssm_parameter" "mongodb" {
  name = "/${var.project}/${var.env}/mongodb_sg_id"
}

data "aws_ssm_parameter" "catalogue" {
  name = "/${var.project}/${var.env}/catalogue_sg_id"
}

data "aws_ssm_parameter" "user" {
  name = "/${var.project}/${var.env}/user_sg_id"
}

data "aws_ssm_parameter" "redis" {
  name = "/${var.project}/${var.env}/redis_sg_id"
}

data "aws_ssm_parameter" "cart" {
  name = "/${var.project}/${var.env}/cart_sg_id"
}

data "aws_ssm_parameter" "mysql" {
  name = "/${var.project}/${var.env}/mysql_sg_id"
}

data "aws_ssm_parameter" "shipping" {
  name = "/${var.project}/${var.env}/shipping_sg_id"
}

data "aws_ssm_parameter" "rabbitmq" {
  name = "/${var.project}/${var.env}/rabbitmq_sg_id"
}

data "aws_ssm_parameter" "payment" {
  name = "/${var.project}/${var.env}/payment_sg_id"
}

data "aws_ssm_parameter" "backend_alb" {
  name = "/${var.project}/${var.env}/backend_alb_sg_id"
}

data "aws_ssm_parameter" "frontend" {
  name = "/${var.project}/${var.env}/frontend_sg_id"
}

data "aws_ssm_parameter" "frontend_alb" {
  name = "/${var.project}/${var.env}/frontend_alb_sg_id"
}
locals {
  bastion_sg_id = data.aws_ssm_parameter.bastion.value
  mongodb_sg_id = data.aws_ssm_parameter.mongodb.value
  catalogue_sg_id = data.aws_ssm_parameter.catalogue.value
  user_sg_id = data.aws_ssm_parameter.user.value
  cart_sg_id = data.aws_ssm_parameter.cart.value
  redis_sg_id = data.aws_ssm_parameter.redis.value
  mysql_sg_id = data.aws_ssm_parameter.mysql.value
  shipping_sg_id = data.aws_ssm_parameter.shipping.value
  rabbitmq_sg_id = data.aws_ssm_parameter.rabbitmq.value
  payment_sg_id = data.aws_ssm_parameter.payment.value
  frontend_sg_id = data.aws_ssm_parameter.frontend.value
  frontend_alb_sg_id = data.aws_ssm_parameter.frontend_alb.value
  backend_alb_sg_id = data.aws_ssm_parameter.backend_alb.value
}
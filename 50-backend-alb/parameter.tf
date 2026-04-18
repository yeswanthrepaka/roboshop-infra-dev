resource "aws_ssm_parameter" "backend_alb_arn" {
  name = "/${var.project}/${var.env}/backend_alb_listener_arn"
  type = string
  value = aws_lb.backend-alb.arn
}
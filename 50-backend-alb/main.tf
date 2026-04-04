resource "aws_lb" "backend-alb" {
  name               = "${var.project}-${var.env}"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [local.backend_alb_sg_id]
  subnets            = local.private_subnet_ids

  enable_deletion_protection = true

  tags = merge(
    {
        Name = "${var.project}-${var.env}"
    },
    local.common_tags
  )
}


resource "aws_lb_listener" "backend_alb" {
  load_balancer_arn = aws_lb.backend-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Hi, I am from Http backend load balancer"
      status_code  = "200"
    }
  }
}


resource "aws_route53_record" "backend_alb" {
  zone_id = var.zone_id
  name    = "*.backend-alb-${var.env}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_lb.backend-alb.dns_name
    # region 
    zone_id                = aws_lb.backend-alb.zone_id
    evaluate_target_health = true
  }
}
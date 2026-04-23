data "aws_cloudfront_cache_policy" "cachingOptimized" {
  name = "Managed-CachingOptimized"
}

data "aws_ssm_parameter" "acm_certificate_arn" {
  name = "/${var.project}/${var.env}/frontend_alb_certificate_arn"
}
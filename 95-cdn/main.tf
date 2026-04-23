resource "aws_cloudfront_distribution" "roboshop" {
  origin {
    domain_name = "frontend-${var.env}.${var.domain_name}"
    origin_id = "frontend-${var.env}.${var.domain_name}"

    custom_origin_config {
        http_port              = 80 // Required to be set but not used
        https_port             = 443
        origin_protocol_policy = "https-only"
        origin_ssl_protocols   = ["TLSv1.2", "TLSv1.1"]
    }
  }

  enabled = true
  is_ipv6_enabled = false

  aliases = ["roboshop-dev.repaka.online"]

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "frontend-${var.env}.${var.domain_name}"
    viewer_protocol_policy = "https-only"
    cache_policy_id = local.cachingOptimized
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      #locations        = ["US", "CA", "GB", "DE"]
    }
  }

  tags = merge(
    {
        Name = "${var.project}-${var.env}-frontend"
    },
    local.common_tags
  )

  viewer_certificate {
    acm_certificate_arn = local.acm_certificate_arn
    ssl_support_method = "sni-only"
  }
}

resource "aws_route53_record" "roboshop" {
  zone_id = var.zone_id
  name    = "${var.project}-${var.env}.${var.domain_name}"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.roboshop.domain_name
    zone_id                = aws_cloudfront_distribution.roboshop.hosted_zone_id
    evaluate_target_health = true
  }
  allow_overwrite = true
}
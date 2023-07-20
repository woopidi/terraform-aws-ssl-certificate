# Create the certificate in the Virgina Region
resource "aws_acm_certificate" "certificate" {
  domain_name               = var.domain_name
  validation_method         = "DNS"
  provider                  = aws.virginia
  subject_alternative_names = ["*.${var.domain_name}"]

  tags = {
    terraform = "true"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Create a rDNS record to validate the certificate 
resource "aws_route53_record" "certificate_record" {
  zone_id = var.zone_id
  ttl     = 60
  name    = tolist(aws_acm_certificate.certificate.domain_validation_options)[0].resource_record_name
  type    = tolist(aws_acm_certificate.certificate.domain_validation_options)[0].resource_record_type
  records = [tolist(aws_acm_certificate.certificate.domain_validation_options)[0].resource_record_value]
}

# Validate the certificate
resource "aws_acm_certificate_validation" "validate" {
  certificate_arn         = aws_acm_certificate.certificate.arn
  provider                = aws.virginia
  validation_record_fqdns = [aws_route53_record.certificate_record.fqdn]
}


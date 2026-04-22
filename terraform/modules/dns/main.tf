resource "aws_route53_zone" "main" {
  name = var.domain_name

  tags = {
    Name    = "${var.project_name}-hosted-zone"
    Project = var.project_name
  }
}

resource "aws_route53_zone" "taskapp" {
  name = "taskapp.${var.domain_name}"

  tags = {
    Name    = "${var.project_name}-taskapp-zone"
    Project = var.project_name
  }
}

resource "aws_route53_zone" "api" {
  name = "api.${var.domain_name}"

  tags = {
    Name    = "${var.project_name}-api-zone"
    Project = var.project_name
  }
}

resource "aws_route53_record" "taskapp_ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "taskapp.${var.domain_name}"
  type    = "NS"
  ttl     = "300"
  records = aws_route53_zone.taskapp.name_servers
}

resource "aws_route53_record" "api_ns" {
  zone_id = aws_route53_zone.main.zone_id
  name    = "api.${var.domain_name}"
  type    = "NS"
  ttl     = "300"
  records = aws_route53_zone.api.name_servers
}

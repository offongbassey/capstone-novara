output "name_servers" {
  description = "Route53 name servers - add these to your domain registrar"
  value       = aws_route53_zone.main.name_servers
}

output "hosted_zone_id" {
  value = aws_route53_zone.main.zone_id
}

output "taskapp_zone_id" {
  value = aws_route53_zone.taskapp.zone_id
}

output "api_zone_id" {
  value = aws_route53_zone.api.zone_id
}

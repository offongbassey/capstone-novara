module "dns" {
  source       = "../../modules/dns"
  project_name = "novara"
  domain_name  = var.domain_name
}

output "route53_name_servers" {
  description = "Add these NS records to your domain registrar"
  value       = module.dns.name_servers
}

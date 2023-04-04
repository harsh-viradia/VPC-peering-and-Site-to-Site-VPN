module "records_public" {
  source = "terraform-aws-modules/route53/aws//modules/records"
  version = "~>2.0"
  zone_id=data.aws_route53_zone.public_zone.id

  records=[{
  name    = "harsh-viradia-netsec"
  type    = "CNAME"
  ttl     = 300
  records = [module.alb.lb_dns_name]
}]
}

data "aws_route53_zone" "public_zone" {
    name = "dns-poc-onprem.tk"
    private_zone = false
}
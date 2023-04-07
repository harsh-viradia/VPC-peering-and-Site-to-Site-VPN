############################################################################################################################################
############################################################################################################################################
####                                                                                                                                    ####
####                                                      Create route53 record                                                         ####
####                                                                                                                                    ####
############################################################################################################################################
############################################################################################################################################


module "records_public" {
  source = "terraform-aws-modules/route53/aws//modules/records"
  version = "~>2.0"

  zone_id=data.aws_route53_zone.public_zone.id

  records=[{
  name    = "harsh-viradia-alb"
  type    = "CNAME"
  ttl     = 300
  records = [module.alb.lb_dns_name]
}]
}

resource "aws_route53_zone_association" "harsh-viradia-record" {
  zone_id = data.aws_route53_zone.private_zone.id
  vpc_id = aws_vpc.harsh-viradia-security-vpc.id
}
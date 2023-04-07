# There is already one certificate for dns-poc-onprem.tk domain name fetech that certificate through terraform data.

data "aws_route53_zone" "private_zone" {
  name = "dns-poc-onprem.tk"
  private_zone = true
}

data "aws_route53_zone" "public_zone" {
    name = "dns-poc-onprem.tk"
    private_zone = false
}

data "aws_acm_certificate" "https_certificate" {
    domain = "dns-poc-onprem.tk"
    statuses = ["ISSUED"]
}
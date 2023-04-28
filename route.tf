resource "aws_route53_record" "mysqlroute" {
  zone_id = "Z01817288AYQJ8IWO87B"
  name    = "www"
  type    = "CNAME"
  ttl     = 5

  weighted_routing_policy {
    weight = 10
  }

  set_identifier = "dev"
  records        = ["dev.example.com"]
}
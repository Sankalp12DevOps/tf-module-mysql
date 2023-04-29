resource "aws_route53_record" "mysqlroute" {
  zone_id = data.terraform_remote_state.vpc.outputs.PRIVATE_HOSTED_ZONE_ID
  name    = "mysql-${var.ENV}"
  type    = "CNAME"
  records = [aws_db_instance.mysql.address]
  ttl     = 5
}
# resource "aws_secretsmanager_secret" "dev_secrets" {
#   name = "dev/secrets"
# }

# resource "aws_secretsmanager_secret_version" "secrets" {
#   secret_id     = aws_secretsmanager_secret.dev_secrets.id
  
# }

# value = jsondecode(aws_secretsmanager_secret_version.secrets.secret_string)["SQL_USERNAME"]
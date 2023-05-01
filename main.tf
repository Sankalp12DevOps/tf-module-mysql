resource "aws_db_instance" "mysql" {
  identifier                   =  "var.SQL_DB_NAME-${var.ENV}"
  allocated_storage            =  10
  # db_name                      =  var.SQL_DB_NAME
  engine                       =  var.SQL_ENGINE
  engine_version               =  var.SQL_ENGINE_VERSION
  instance_class               =  var.SQL_INSTANCE_CLASS
  username                     =  var.SQL_USERNAME
  password                     =  var.SQL_PASSWORD
  parameter_group_name         =  aws_db_parameter_group.robo_mysql_paramgroup.name
  vpc_security_group_ids       =  [aws_security_group.allow_robosop_mysql.id]
  db_subnet_group_name         =  aws_docdb_subnet_group.default.name
  skip_final_snapshot          =  true
}

resource "aws_db_parameter_group" "robo_mysql_paramgroup" {
  name   = "${var.ENV}-rds-pg"
  family = "mysql5.7"
}

resource "aws_docdb_subnet_group" "default" {
  name       = "${var.ENV}--subnet-group"
  subnet_ids =  data.terraform_remote_state.vpc.outputs.PRVT_SUBNET_IDS
  tags = {
    Name = "My sqldb subnet group"
  }
}

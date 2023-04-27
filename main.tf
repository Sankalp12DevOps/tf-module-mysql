resource "aws_db_instance" "mysql" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "admin1"
  password             = "Roboshop@1"
  parameter_group_name =  aws_db_parameter_group.robomysqlparamgroup.name
  security_group_names =  [aws_security_group.allow_tls-robosop_mysql.name]
  skip_final_snapshot  = true
}

resource "aws_db_parameter_group" "robomysqlparamgroup" {
  name   = "${var.ENV}-rds-pg"
  family = "mysql5.7"
}

resource "aws_docdb_subnet_group" "default" {
  name       = "${var.ENV}-docdb-subnet-group"
  subnet_ids =  data.terraform_remote_state.vpc.outputs.PRVT_SUBNET_IDS
  tags = {
    Name = "My sqldb subnet group"
  }
}

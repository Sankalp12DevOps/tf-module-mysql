resource "null_resource" "web" {
  provisioner "local-exec" {
    command = <<EOF
    curl -s -L -o /tmp/mysql.zip "https://github.com/stans-robot-project/mysql/archive/main.zip"
    cd /tmp
    unzip mysql.zip
    cd mysql-main
    mysql -h ${aws_db_instance.mysql.address} -uadmin1 -pRoboshop1 <shipping.sql
    EOF
  }
}



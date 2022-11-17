resource "aws_db_instance" "db" {
  allocated_storage    = 8
  engine               = "mysql"
  engine_version       = "8.0"
  parameter_group_name = "default.mysql8.0"
  instance_class      = "db.t3.micro"
  db_name             = "production"
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
  tags = {
    Name = "production"
  }
}

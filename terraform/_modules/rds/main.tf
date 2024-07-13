resource "aws_db_instance" "rds_db" {
  allocated_storage    = 10
  db_name              = var.db_name
  identifier           = var.db_name
  port                 = var.db_port
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  username             = var.username
  parameter_group_name = aws_db_parameter_group.rds_prg.name
  manage_master_user_password   = true
  skip_final_snapshot  = true

  depends_on = [ aws_db_parameter_group.rds_prg ]
}

resource "aws_db_parameter_group" "rds_prg" {
  name   = "${var.project}-${var.env}-rds-db-prg"
  family = "mysql5.7"

}


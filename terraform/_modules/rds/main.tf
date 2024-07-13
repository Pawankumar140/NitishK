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
  db_subnet_group_name = "${var.project}-${var.env}-db-subnet-group"
  manage_master_user_password   = true
  skip_final_snapshot  = true

  depends_on = [ aws_db_parameter_group.rds_prg ]
}

resource "aws_db_parameter_group" "rds_prg" {
  name   = "${var.project}-${var.env}-rds-db-prg"
  family = "mysql8.0"

}


# resource "aws_security_group" "database_sg" {
#   name = "${var.project}-${var.env}-rds-db-sg"
#   description = "${var.project}-${var.env}-rds-db-sg"

#   vpc_id = modu

#   egress {
#     from_port        = 0
#     to_port          = 0
#     protocol         = "-1"
#     cidr_blocks      = ["0.0.0.0/0"]
#     ipv6_cidr_blocks = ["::/0"]
#   }
# }


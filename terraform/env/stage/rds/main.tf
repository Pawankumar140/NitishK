module "rds" {
  source = "../../../_modules/rds"

# Common Variable to use in modules
  env = var.env
  project = var.project
  aws_region = var.aws_region

  db_name = "${var.project}${var.env}rdsdb"
  db_port = "3210"

  instance_class = "db.t3.micro"
  engine  = "mysql"
  engine_version = "8.0.35"
  
  username = "demodbroot"
  manage_master_user_password = true

  }


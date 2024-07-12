module "rds" {
  source = "../../../_modules/rds"

  db_name = "${var.project}-${var.env}-internet-gateway"
  
  }

variable "project" {
    default = "demo"
    type = string
  
}

variable "env" {
  default = "stage"
  type = string
}
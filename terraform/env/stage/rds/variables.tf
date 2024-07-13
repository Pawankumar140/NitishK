variable "project" {
    default = "demo"
    type = string
  
}

variable "env" {
  default = "stage"
  type = string
}

variable "aws_region" {
  default = "eu-west-1"
}


variable "db_name" {
  default = null
}
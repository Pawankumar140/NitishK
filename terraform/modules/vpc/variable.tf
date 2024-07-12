# Module Variables for demo

variable aws_region {}
variable cidr_block {}
variable "project" {}
variable "env" {}

variable "public_subnet" {
    type = list
    default = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24"]
  
}
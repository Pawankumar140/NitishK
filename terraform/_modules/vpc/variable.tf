# Module Variables for demo

variable aws_region {}
variable "project" {}
variable "env" {}

variable "public_subnet" {}
variable "private_subnet" {}
variable cidr_block {}
variable "azs" {}
variable "public_subnet_names" {
    type = list(string)
    default = [ ]
}

variable "private_subnet_names" {
    type = list(string)
    default = [ ]
}


variable "public_subnet_suffix" {
    default = "public-subnet"
}

variable "private_subnet_suffix" {
    default = "private-subnet"
}

variable "aws_region" {
  default = "eu-west-1"
}

variable "cidr_block" {
  default = "172.18.0.0/16"
  type = string
}

variable "project" {
    default = "demo"
    type = string
  
}

variable "env" {
  default = "stage"
  type = string
}


variable "public_subnet" {
    type = string
    default = "172.18.1.0/24"  
}


variable "private_subnet" {
    type = string
    default = "172.18.2.0/24"  
}

# variable "AMIS" {
#   type = "map"

#   default = {
#     us-east-1 = "ami-13be557e"
#     us-west-2 = "ami-06b94666"
#   }
# }
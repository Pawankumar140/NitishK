module "stage-vpc" {
  source = "../../../_modules/vpc"

  aws_region = var.aws_region
  cidr_block = var.cidr_block
  project = var.project
  env = var.env

  azs               = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
  public_subnet     = ["172.18.1.0/24", "172.18.2.0/24", "172.18.3.0/24"]
  private_subnet    = ["172.18.4.0/24", "172.18.5.0/24", "172.18.6.0/24"]



}
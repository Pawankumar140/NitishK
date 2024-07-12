module "vpc" {
  source = "../../../_modules/vpc"

  aws_region = var.aws_region
  cidr_block = var.cidr_block
  project = var.project
  env = var.env

  public_subnet = var.public_subnet
  private_subnet = var.private_subnet


}
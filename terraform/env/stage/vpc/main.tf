module "stage-vpc" {
  source = "../../../modules/vpc"

  aws_region = var.aws_region
  cidr_block = var.cidr_block
  project = var.project
  env = var.env
}
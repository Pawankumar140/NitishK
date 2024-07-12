terraform {
  backend "s3" {
    bucket = "nitishk1"
    key = "terraform/state/vpc"
    region = "eu-west-1"
  }
}
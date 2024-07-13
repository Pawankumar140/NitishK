terraform {
  backend "s3" {
    bucket = "nitishk1"
    key = "terraform/state/rds"
    region = "eu-west-1"
  }
}
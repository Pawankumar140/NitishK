terraform {
  backend "s3" {
    bucket = "nitishk"
    key = "terraform/state/vpc"
    region = "ap-south-1"
  }
}
provider "aws" {
  region = "us-east-1"
  version = "~> 1.57.0"
}

//terraform {
//  backend "s3" {
//    bucket = "mc-tfstate"
//    key    = "demo.tfstate"
//    region = "us-east-1"
//  }
//}

module "ops_users" {
  source = "modules/users"

  ops_users = [
//    "ecurbo",
    "fboyd",
  ]
}

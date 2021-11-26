provider "aws" {
  region = var.region
}

module "user" {
  source    = "../../modules/iam-user-minimilistic"
  user_name = "test_user"
  groups    = ["test_group"]
}
provider "aws" {
  region = var.region
}

module "user" {
  source    = "./iam-user"
  user_name = var.user_name
  pgp_key   = "keybase:osterman"
  groups    = []

}
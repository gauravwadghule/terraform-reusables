provider "aws" {
  region = var.region
}

module "user" {
  source    = "../../modules/iam-user"
  user_name = var.user_name
  pgp_key   = "keybase:osterman"
  groups    = []

}
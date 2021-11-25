provider "aws" {
  region = var.region
}

module "group" {
  source    = "../../modules/iam-group-minimilistic"
  group_name = var.group_name
}
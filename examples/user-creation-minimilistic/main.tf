module "user" {
  source    = "../../modules/iam-user-minimilistic"
  user_name = var.user_name
}
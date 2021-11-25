provider "aws" {
  region = var.region
}

module "group" {
  source    = "../../modules/iam-group-minimilistic"
  group_name = "test_group"
  iam_policy = {
    Version = "2012-10-17",
    Statement = [
      {
        Action = [
          "ec2:Describe*"
        ]
        Effect   = "Allow"
        Resource = "*"
      }
    ]
  }
}
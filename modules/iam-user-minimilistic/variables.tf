
variable "user_name" {
  type        = string
  description = "Desired name for the IAM user. We recommend using email addresses."

validation {
    condition     =  var.user_name != null
    error_message = "Username could not be empty."
  }
}

variable "path" {
  type        = string
  description = "Desired path for the IAM user"
  default     = "/"
  validation {
    condition     = can(regex("^(/)", var.path))
    error_message = "Path must be valid it must start with forward slash(/)."
  }
}

variable "permissions_boundary" {
  type        = string
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
  default     = ""
  validation {
    condition     = can(regex("^arn:aws:iam::[[:digit:]]{12}:policy/.+", var.permissions_boundary))
    error_message = "The ARN of the policy must be a valid."
  }
}

variable "force_destroy" {
  type        = bool
  description = "When destroying this user, destroy even if it has non-Terraform-managed IAM access keys, login profile or MFA devices. Without force_destroy a user with non-Terraform-managed access keys and login profile will fail to be destroyed."
  default     = false
}

variable "tags" {
  type        = map
  description = "All tags are specified in this variable as key and value pair."
  default     = {}
}

variable "groups" {
  description = "List of IAM user groups this user should belong to in the account"
  type        = list(string)
  default     = []
}

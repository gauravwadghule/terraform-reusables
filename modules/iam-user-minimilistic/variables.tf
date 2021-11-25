
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
}

variable "permissions_boundary" {
  type        = string
  description = "The ARN of the policy that is used to set the permissions boundary for the user"
  default     = ""
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

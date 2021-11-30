
variable "group_name" {
  type        = string
  description = "Desired name for the IAM group."

  validation {
    condition     = var.group_name != null
    error_message = "Group name could not be empty."
  }
}

variable "path" {
  type        = string
  description = "Desired path for the IAM group"
  default     = "/"
}

variable "iam_policy" {
  type = object({
    Version = string
    Statement = list(object({
      Action   = list(string)
      Effect   = string
      Resource = string
    }))
  })
  description = "IAM policy JSON"
}

variable "group_policy_name" {
  type        = string
  description = "Desired name of the group policy name"
  default     = null
}

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
  validation {
    condition     = can(regex("^(2012-10-17|2008-10-17)$", var.iam_policy.Version))
    error_message = "IAM Policy Version should be valid."
  }

  validation {
    condition     = alltrue([
      for statement in var.iam_policy.Statement : can(regex("^(Allow|Deny)$", statement.Effect))
    ])
    error_message = "IAM Policy Effect should be valid (Allow|Deny)."
  }
}

variable "group_policy_name" {
  type        = string
  description = "Desired name of the group policy name"
  default     = null
}

variable "group_name" {
  type        = string
  description = "Desired name for the IAM group."

validation {
    condition     =  var.group_name != null
    error_message = "Group name could not be empty."
  }
}

variable "path" {
  type        = string
  description = "Desired path for the IAM group"
  default     = "/"
}

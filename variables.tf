variable "builtin_roles" {
  description = "List of built-in roles to extend."
  type        = list(string)
  default     = []
}

variable "additional_permission" {
  description = "Additional permissions for extended role."
  type = object({
    actions : list(string),
    not_actions : list(string),
    data_actions : list(string),
    not_data_actions : list(string)
  })
  default = {
    actions : [],
    not_actions : [],
    data_actions : [],
    not_data_actions : []
  }
}

variable "custom_role_name" {
  description = "Custom role name."
  type = string
}

variable "custom_role_scope" {
  description = "Role scope."
  type = string
}

variable "custom_role_description" {
  description = "Role description."
  type = string
}

variable "custom_role_assignable_scopes" {
  description = "Role assignable scopes."
  type = list(string)
}

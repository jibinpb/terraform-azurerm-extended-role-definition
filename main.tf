data "azurerm_subscription" "current" {}

data "azurerm_role_definition" "builtin_roles" {
  for_each = toset(var.builtin_roles)
  name     = each.key
}

resource "azurerm_role_definition" "custom_role" {
  name              = var.custom_role_name
  scope             = var.custom_role_scope
  description       = var.custom_role_description
  assignable_scopes = var.custom_role_assignable_scopes

  permissions {
    actions          = distinct(concat(flatten(values(data.azurerm_role_definition.builtin_roles)[*]["permissions"][0]["actions"]), var.additional_permission.actions))
    not_actions      = distinct(concat(flatten(values(data.azurerm_role_definition.builtin_roles)[*]["permissions"][0]["not_actions"]), var.additional_permission.not_actions))
    data_actions     = distinct(concat(flatten(values(data.azurerm_role_definition.builtin_roles)[*]["permissions"][0]["data_actions"]), var.additional_permission.data_actions))
    not_data_actions = distinct(concat(flatten(values(data.azurerm_role_definition.builtin_roles)[*]["permissions"][0]["not_data_actions"]), var.additional_permission.not_data_actions))
  }
}

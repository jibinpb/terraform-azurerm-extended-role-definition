output "actions" {
  value = azurerm_role_definition.custom_role.permissions[0].actions
}

output "not_actions" {
  value = azurerm_role_definition.custom_role.permissions[0].not_actions
}

output "data_actions" {
  value = azurerm_role_definition.custom_role.permissions[0].data_actions
}

output "not_data_actions" {
  value = azurerm_role_definition.custom_role.permissions[0].not_data_actions
}

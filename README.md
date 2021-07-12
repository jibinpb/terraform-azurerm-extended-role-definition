# Azure Extended custom roles

## Example

```terraform
data "azurerm_subscription" "primary" {}

module "extended_role_definition" {
  source  = "jibinpb/extended-role-definition/azurerm"

  builtin_roles = [
    "API Management Service Contributor",
    "Storage Blob Data Owner",
  ]
  custom_role_name        = "GBN SAMPLE AZR CUSTOM RESOURCE ROLE MODULE"
  custom_role_scope       = data.azurerm_subscription.primary.id
  custom_role_description = "Custom role for testing"
  custom_role_assignable_scopes = [
    data.azurerm_subscription.primary.id,
  ]
  additional_permission = {
    actions : ["Microsoft.Storage/storageAccounts/*"],
    not_actions : ["Microsoft.Support/*"],
    data_actions : [],
    not_data_actions : ["Microsoft.Storage/storageAccounts/blobServices/containers/blobs/delete"]
  }
}


output "actions" {
  value = module.extended_role_definition.actions
}

output "not_actions" {
  value = module.extended_role_definition.not_actions
}

output "data_actions" {
  value = module.extended_role_definition.not_actions
}

output "not_data_actions" {
  value = module.extended_role_definition.not_actions
}

```

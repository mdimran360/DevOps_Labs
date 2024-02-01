resource "azurerm_resource_group" "rgblock" {
  name     = "Imran_RG"
  location = "Central India"
}


resource "azurerm_key_vault" "kvblock" {
   depends_on = [ azurerm_resource_group.rgblock ]
  for_each                    = var.kv
  name                        = each.value.name
  location                    = each.value.location
  resource_group_name         = each.value.resource_group_name
  enabled_for_disk_encryption = each.value.enabled_for_disk_encryption
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = each.value.soft_delete_retention_days
  purge_protection_enabled    = each.value.purge_protection_enabled
  sku_name                    = each.value.sku_name

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
      "Get",  "Backup", "List", "Recover", "Restore", "Set", "Delete"
    ]

    storage_permissions = [
      "Get",
    ]
  }
}

data "azurerm_client_config" "current" {
}

output "account_id" {
  value = data.azurerm_client_config.current.client_id
}

# resource "azurerm_key_vault_secret" "username" {
#   name         = "username"
#   value        = "Imran"
#   key_vault_id = data.azurerm_client_config.current.id
# }


data "azurerm_key_vault_secret" "username" {
  name         = "username" 
  key_vault_id = "imrankeyvault"
}

data "azurerm_key_vault_secret" "password" {
  name         = "password"
  key_vault_id = "imrankeyvault"
}
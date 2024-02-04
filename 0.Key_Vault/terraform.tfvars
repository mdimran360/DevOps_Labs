kv = {
  kv1 = {
    name                        = "imrankeyvault"
    location                    = "Central India"
    resource_group_name         = "Imran_RG"
    enabled_for_disk_encryption = true
    soft_delete_retention_days  = 7
    purge_protection_enabled    = false

    sku_name = "standard"

  }
}
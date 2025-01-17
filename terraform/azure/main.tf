resource "azurerm_resource_group" "main" {
  name     = "main"
  location = "Japan East"
}

resource "azurerm_storage_account" "main" {
  name                     = "main"
  resource_group_name      = azurerm_resource_group.main.name
  location                 = azurerm_resource_group.main.location

  account_tier             = "Standard"
  account_replication_type = "LRS"

  # Security settings
  allow_nested_items_to_be_public = false

  depends_on = [ azurerm_resource_group.main ]
}

resource "azurerm_storage_account_network_rules" "main" {
  storage_account_id = azurerm_storage_account.main.id
  default_action             = "Deny"
}

resource "azurerm_postgresql_flexible_server" "dbserver" {
  name                   = var.database_server_name
  resource_group_name    = var.resource_group_name
  location               = var.location
  version                = "16"
  administrator_login    = var.admin_db_username
  administrator_password = var.db_passowrd
  storage_mb             = 32768
  sku_name               = "GP_Standard_D4s_v3"

}


resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = "projectdb"
  server_id = azurerm_postgresql_flexible_server.dbserver.id
  collation = "en_US.utf8"
  charset   = "UTF8"

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = false
  }
}

resource "azurerm_postgresql_firewall_rule" "dbfirewall" {
  name                = "dbfirewall"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_flexible_server.dbserver.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"

  depends_on = [ azurerm_postgresql_flexible_server.dbserver ]
}

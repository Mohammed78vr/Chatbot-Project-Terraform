output "database_host" {
  value = azurerm_postgresql_flexible_server.dbserver.fqdn
}

output "database_username" {
  value = azurerm_postgresql_flexible_server.dbserver.administrator_login
}

output "database_name" {
  value = azurerm_postgresql_flexible_server_database.db.name
}

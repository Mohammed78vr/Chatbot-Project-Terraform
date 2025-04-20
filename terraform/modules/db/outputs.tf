output "database_host" {
  value = azurerm_postgresql_flexible_server.dbserver.fqdn
}
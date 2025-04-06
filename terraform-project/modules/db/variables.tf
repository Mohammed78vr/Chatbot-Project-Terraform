variable "resource_group_name" {
  description = "Azure resource group name"
  type = string
}

variable "location" {
  description = "Region location"
  type = string
}

variable "database_server_name" {
  description = "database server name"
  type = string
}

variable "admin_db_username" {
  description = "Database server username"
  type = string
}

variable "db_passowrd" {
  description = "database server password"
  type = string
}
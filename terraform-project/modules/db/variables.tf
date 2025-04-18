variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

variable "database_server_name" {
  description = "database server name"
  type        = string
}

variable "admin_db_username" {
  description = "Database server username"
  type        = string
}

variable "db_passowrd" {
  description = "database server password"
  type        = string
}

variable "database_name" {
  description = "database name"
  type        = string
}

variable "start_ip_address" {
  description = "start IP address for azure database firewall rules"
  type        = string
  default     = "0.0.0.0"
}

variable "end_ip_address" {
  description = "End IP address for azure database firewall"
  type        = string
  default     = "0.0.0.0"
}

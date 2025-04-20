variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

variable "key_vault_name" {
  description = "The name of the key vaults"
  type        = string
}

variable "manged_identity_id" {
  description = "Managed Identity id from the vmss"
  type        = string
}

variable "database_host" {
  description = "The private IP address for the VM that run chromadb"
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

variable "storage_SAS" {
  description = "Shared access signiture url"
  type        = string
}

variable "container_name" {
  description = "Container name"
  type        = string
}

variable "chroma_vm_private_ip_address" {
  description = "The private IP address for the VM that run chromadb"
  type        = string
}

variable "OpenAi_key" {
  description = "OpenAI key secret"
  type        = string
}

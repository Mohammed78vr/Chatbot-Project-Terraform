variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

variable "container" {
  description = "Container name"
  type        = string
}


variable "storage_account_sas_start" {
  description = "Starting time for the Shared access signiture"
  type        = string
  default     = timestamp()
}

variable "storage_account_sas_expiry" {
  description = "expiring time for the Shared access signiture"
  type        = string
  default     = timeadd(timestamp(), "240h")
}

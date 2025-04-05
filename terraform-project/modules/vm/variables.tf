variable "resource_group_name" {
  description = "Azure resource group name"
  type = string
}

variable "location" {
  description = "Region location"
  type = string
}

variable "subnet_id" {
  description = "Subnet Id in the Vnet"
  type = string
}
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

variable "vmPublicIp" {
  description = "Public Ip address for the VM"
  type = string
}

variable "nic" {
  description = "Network Interface Card Name"
  type = string
}

variable "vm" {
  description = "Virtual machine (VM) Name"
  type = string
}

variable "adminUserName" {
  description = "Username for the ssh admin key"
  type = string
}
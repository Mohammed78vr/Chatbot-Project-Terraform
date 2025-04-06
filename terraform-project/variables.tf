variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}
#======================= variables for recourse group =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type = string
}

variable "location" {
  description = "Region location"
  type = string
}
#======================= varibales for Vnet modules =======================
variable "VnetName" {
  description = "Name of the Virtual Network"
  type = string
}

variable "subnetName" {
  description = "Name of the Subnet"
  type = string
}

variable "nsg" {
  description = "Netowrk security group name"
  type = string
}
#======================= varibales for VM modules =======================
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
#======================= varibales for storage modules =======================
variable "container" {
  description = "Container name"
  type = string
}
#======================= varibales for db modules =======================
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
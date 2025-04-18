variable "subscription_id" {
  description = "Azure subscription ID"
  type        = string
}
#======================= variables for recourse group =======================
variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}
#======================= varibales for Vnet modules =======================
variable "Vnet_Name" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "Web_app_subnet_Name" {
  description = "Name of the Subnet for web appliaction"
  type        = string
}

variable "application_gateway_subnet_name" {
  description = "Name of the Subnet for application subnet"
  type        = string
}

#======================= varibales for VM modules =======================
variable "vm" {
  description = "Virtual machine (VM) Name"
  type        = string
}

variable "adminUserName" {
  description = "Username for the ssh admin key"
  type        = string
}
#======================= varibales for storage modules =======================
variable "container" {
  description = "Container name"
  type        = string
}
#======================= varibales for db modules =======================
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

#======================= varibales for VMSS modules =======================
variable "vmss_name" {
  description = "Then name of the VM Scale Set"
  type        = string
}
variable "source_image_id" {
  description = "The image you want to use in the VMSS"
  type        = string
}
#======================= varibales for Application Gateway modules =======================
variable "appliaction_gateway_public_ip_name" {
  description = "the name of the public ip for application gateway"
  type        = string
}

variable "application_gateway_name" {
  description = "the name of the application gateway"
  type        = string
}

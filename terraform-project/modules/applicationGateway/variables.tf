variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

variable "VnetName" {
  description = "Name of the Virtual Network"
  type        = string
}

variable "application_gateway_subnet_id" {
  description = "The id of the subnet for application gateway"
  type        = string
}

variable "appliaction_gateway_public_ip_name" {
  description = "the name of the public ip for application gateway"
  type        = string
}

variable "application_gateway_name" {
  description = "the name of the application gateway"
  type        = string
}

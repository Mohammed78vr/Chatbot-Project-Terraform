variable "resource_group_name" {
  description = "Azure resource group name"
  type        = string
}

variable "location" {
  description = "Region location"
  type        = string
}

variable "subnet_id" {
  description = "Subnet Id in the Vnet"
  type        = string
}

variable "backend_pool_id" {
  description = "the backend pool assocciated wtih ip configuartion in vmss"
  type        = string
}

variable "vmss_name" {
  description = "Then name of the VM Scale Set"
  type        = string
}

variable "source_image_id" {
  description = "The image you want to use in the VMSS"
  type        = string
}

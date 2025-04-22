output "vm_public_ip_address" {
  value = module.Vm.vm_public_ip_address
}

output "application_gateway_public_ip_address" {
  value = module.application_gateway.application_gateway_public_ip_address
}
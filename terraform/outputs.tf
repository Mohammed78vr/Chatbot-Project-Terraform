output "vm_public_ip_address" {
  value = module.Vm.vm_public_ip_address
}

output "application_gateway_public_ip_address" {
  value = module.application_gateway.application_gateway_public_ip_address
}

output "database_host" {
  value = module.db.database_host
}

output "database_username" {
  value = module.db.database_username
}

output "database_name" {
  value = module.db.database_name
}

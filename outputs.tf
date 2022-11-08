output "internal_ip_address_vm_1" {
  value = module.ya_instance_1.internal_ip_address_vm
  description = "internal ip address vm-1"
}

output "external_ip_address_vm_1" {
  value = module.ya_instance_1.external_ip_address_vm
  description = "external ip address vm-1"
}

output "internal_ip_address_vm_2" {
  value = module.ya_instance_2.internal_ip_address_vm
  description = "internal ip address vm-2"
}

output "external_ip_address_vm_2" {
  value = module.ya_instance_2.external_ip_address_vm
  description = "external ip address vm-2"
}

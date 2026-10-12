output "public_ip_address" {
  description = "Public IPv4 address of the Ubuntu VM."
  value       = azurerm_public_ip.vm.ip_address
}

output "website_url" {
  description = "Open this URL after cloud-init completes."
  value       = "http://${azurerm_public_ip.vm.ip_address}:8080"
}

output "ssh_command" {
  description = "SSH command restricted by operator_cidr."
  value       = "ssh ${var.admin_username}@${azurerm_public_ip.vm.ip_address}"
}

output "docker_data_disk_name" {
  description = "Managed disk mounted at /data for Docker and Minikube data."
  value       = azurerm_managed_disk.docker.name
}

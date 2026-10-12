variable "subscription_id" {
  description = "Azure subscription ID."
  type        = string
  sensitive   = true
}

variable "tenant_id" {
  description = "Microsoft Entra tenant ID."
  type        = string
  sensitive   = true
}

variable "name_suffix" {
  description = "Short lowercase suffix used to make resource names distinct."
  type        = string
  validation {
    condition     = can(regex("^[a-z0-9-]{3,30}$", var.name_suffix))
    error_message = "Use 3-12 lowercase letters, numbers or hyphens."
  }
}

variable "location" {
  description = "Azure region allowed by the student subscription."
  type        = string
  default     = "Denmark East"
}

variable "operator_cidr" {
  description = "Your public IPv4 address with /32, used to restrict SSH access."
  type        = string
}

variable "admin_username" {
  description = "Ubuntu administrator username."
  type        = string
  default     = "azureadmin"
}

variable "admin_ssh_public_key" {
  description = "Public SSH key contents, for example ssh-ed25519 AAAA..."
  type        = string
  sensitive   = true
}

variable "vm_size" {
  description = "Small Basv2 VM size previously usable with the student subscription."
  type        = string
  default     = "Standard_B2as_v2"
}

variable "docker_data_disk_size_gb" {
  description = "Size of the dedicated managed disk used by Docker and Minikube."
  type        = number
  default     = 32

  validation {
    condition     = var.docker_data_disk_size_gb >= 32
    error_message = "Use at least 32 GiB so Minikube and Docker have enough working space."
  }
}

variable "hello_message" {
  description = "Text displayed by the containerized web page."
  type        = string
  default     = "Hello World from Minikube on Azure!"
}

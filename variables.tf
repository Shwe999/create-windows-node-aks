variable "resource_group_location" {
  type        = string
  default     = "eastasia"
  description = "Location of the resource group."
}

variable "resource_group_name" {
  type        = string
  default     = "rgforaks"
  description = "Name of the resource group"
}

variable "node_count_linux" {
  type        = number
  description = "The initial quantity of Linux nodes for the node pool."
  default     = 1
}

variable "node_count_windows" {
  type        = number
  description = "The initial quantity of Windows nodes for the node pool."
  default     = 1
}

variable "admin_username" {
  type        = string
  description = "The admin username for the Windows node pool."
  default     = "azureuser"
}

variable "admin_password" {
  type        = string
  description = "The admin password for the Windows node pool."
  default     = "Passw0rd1234Us!"
}
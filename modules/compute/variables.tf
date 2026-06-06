variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "subnet_id" {}
variable "public_key" {}

variable "admin_username" {
  default = "azureuser"
}   
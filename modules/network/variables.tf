variable "vnet_name" {}
variable "subnet_name" {}
variable "location" {}
variable "resource_group_name" {}

variable "address_space" {
  type = list(string)
}


variable "subnet_address_prefix" {
  type = list(string)
}
variable "nsg_id" {}

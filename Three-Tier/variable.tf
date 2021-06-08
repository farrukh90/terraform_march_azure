variable "location" {}
variable "address_space" {}
variable "vnet_name" {}
variable "resource_group_name" {}
variable "private_subnet1_range" {}
variable "private_subnet2_range" {}
variable "private_subnet3_range" {}


variable "public_subnet1_range" {}
variable "public_subnet2_range" {}
variable "public_subnet3_range" {}



variable "tags" {
  type = map(string)
}

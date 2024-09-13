variable "resource_group_name" {
  description = "Name of the resource group to be created"
  type        = string
  default     = "ikigai-resource-group"
}

variable "virtual_network_name" {
  description = "Name of the ikigai virtual network"
  type        = string
  default     = "ikigai-virtual-network"
}

variable "virtual_network_address_space" {
  description = "Address space of the ikigai virtual network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "private_subnet_name" {
  description = "Name of the private subnet"
  type        = string
  default     = "private-subnet"
}

variable "private_subnet_address_prefix" {
  description = "Address prefix of the private subnet"
  type        = string
  default     = "10.0.32.0/19"
}

variable "database_subnet_name" {
  description = "Name of the database subnet"
  type        = string
  default     = "database-subnet"
}

variable "database_subnet_address_prefix" {
  description = "Address prefix of the database subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "application_gateway_subnet_name" {
  description = "Name of the application gateway subnet"
  type        = string
  default     = "application-gateway-subnet"
}

variable "application_gateway_subnet_address_prefix" {
  description = "Address prefix of the application gateway subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "nat_gateway_name" {
  description = "Name of the ikigai NAT gateway"
  type        = string
  default     = "ikigai-NAT-gateway"
}

variable "nat_gateway_public_ip_name" {
  description = "Name of the public IP associated with the NAT gateway"
  type        = string
  default     = "ikigai-NAT-Gateway-Public-IP"
}

variable "route_table_name" {
  description = "Name of the route table for internet gateway access"
  type        = string
  default     = "ikigai-route-table"
}

variable "security_group_name" {
  description = "Name of the security group for the ikigai virtual network"
  type        = string
  default     = "ikigai-security-group"
}
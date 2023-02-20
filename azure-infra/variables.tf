
################################ resource group ############################
variable "resource_group_name" {
  type = string
}
variable "resource_group_location" {
  type = string
}

variable "security_group_name" {
  type = string
}
############################### virtual network ##############################  

variable "virtual_newtwork_name" {
  type = string
  
}
variable "address_space" {
  type = string
  
}
variable "subnet_name_1" {
  type = string
  
}
variable "address_prefix_1" {
  type = string
  
}
variable "subnet_name_2" {
  type = string
  
}
variable "address_prefix_2" {
  type = string
  
}
######################### nat gateway #############################
variable "nat_gateway_publicip" {
  type = string
}
variable "allocation_method" {
  type = string  
}
variable "nat_gateway_name" {
  type = string  
}
variable "nat_gateway_idle_timeout" {
  type = string
}
############################ route table #############################
variable "route_table_name" {
  type = string  
}
variable "disable_bgp_route_propagation" {
  type = string 
}
variable "route_prefixes" {
  type = string 
}
variable "route_name" {
  type = string  
}
variable "route_nexthop_types" {
  type = string 
}

########################### private route table #########################
variable "private-route_table_name" {
  type = string
}
variable "private-disable_bgp_route_propagation" {
  type = string 
}
variable "private-route_name" {
  type = string
}
variable "private-route_prefixes" {
  type = string
}
variable "private-route_nexthop_types" {
  type = string
}
############################# virtual machine ######################################
variable "azurerm_public_ip_name" {
  type = string
}

variable "idle_timeout_in_minutes" {
  type = string
}
variable "azurerm_network_security_group_name" {
  type = string
  
}

variable "azure_network_interface_name" {
  type = string
}
variable "ip_name" {
  type = string
}
variable "private_ip_address_allocation" {
  type = string
}
variable "ssh_key_name" {
  type = string
}

variable "azure_virtual_machine_name" {
  type = string
}
variable "size" {
  type = string
}
variable "computer_name" {
  type = string
}
variable "admin_username" {
  type = string
}

variable "username" {
  type = string
}
variable "caching" {
  type = string
}
variable "storage_account_type" {
  type = string
}
variable "image_publisher" {
  type = string
}
variable "image_offer" {
  type = string 
}
variable "image_sku" {
  type = string
}
variable "image_version" {
  type = string
}

############################ private virtual machine #############################

variable "private_azurerm_network_security_group_name" {
  type = string
}
variable "private_azure_network_interface_name" {
  type = string
}
variable "private_azure_virtual_machine_name" {
  type = string
}
variable "private-ssh_key_name" {
  type = string
}

################################## Cosmo DB ############################

variable "cosmos_db_account_name" {
  type = string
}
variable "offer_type" {
  type = string
}
variable "kind" {
  type = string
}
variable "enable_automatic_failover" {
  type = string
}
variable "failover_location" {
  type = string
}
variable "consistency_level" {
  type = string
}
variable "capacity_mode" {
  type = string
}
variable "database_name" {
  type = string
}
variable "container_name" {
  type = string
}
variable "partition_key_path" {
  type = string
}
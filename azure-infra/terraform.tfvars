
############################ virtual network #################################
resource_group_name     = "tf-resource-group"
resource_group_location = "West Europe"
security_group_name     = "azure-sg"
virtual_newtwork_name   = "azure-virtual-network"
address_space           = "10.0.0.0/16"
subnet_name_1           = "azure-public-subnet"
address_prefix_1        = "10.0.1.0/24"
subnet_name_2           = "azure-private-subnet"
address_prefix_2        = "10.0.2.0/24"

######################### nat gatway ####################################
nat_gateway_publicip     = "azure-nat-publicip"
allocation_method        = "Static" 
nat_gateway_name         = "azure-nat-gateway"
nat_gateway_idle_timeout = "10"

############################ route table ##################################
route_table_name              = "azure-route-table"
disable_bgp_route_propagation = "false"
route_prefixes                = "0.0.0.0/0"
route_name                    = "azure-public-route"
route_nexthop_types           = "Internet"

############################ private route table #########################
private-route_table_name = "azure-private-route-table"
private-disable_bgp_route_propagation = "false"
private-route_name = "azure-private-route"
private-route_prefixes = "10.0.2.0/24"
private-route_nexthop_types = "VirtualNetworkGateway"


############################## virtual machine #################################
azurerm_public_ip_name = "test-ip"
idle_timeout_in_minutes = "10"  
azurerm_network_security_group_name = "myNetworkSecurityGroup"
azure_network_interface_name  = "azure-netwrok-interface"
ip_name                       = "azure-ip"
private_ip_address_allocation = "Dynamic"
ssh_key_name                  = "vm-ssh-key"
azure_virtual_machine_name    = "azure-virtual-machine"
size                          = "Standard_B1s"
computer_name                 = "myvm"
admin_username                = "softobiz-risav"
username                      = "softobiz-risav"
caching                       = "ReadWrite"
storage_account_type          = "Standard_LRS"
image_publisher               = "Canonical"
image_offer                   = "0001-com-ubuntu-server-focal"
image_sku                     = "20_04-lts-gen2"
image_version                 = "latest"

################################ private vm ##################################
private_azurerm_network_security_group_name = "private-nsg"
private_azure_network_interface_name = "private-network-interface"
private_azure_virtual_machine_name    = "private-virtual-machine"
private-ssh_key_name = "private-ssh-key"

############################### Cosmos DB ########################################
cosmos_db_account_name = "azure-database"
offer_type = "Standard"
kind = "GlobalDocumentDB"
enable_automatic_failover = "false"
failover_location = "West Europe"
consistency_level = "Session"
capacity_mode = "EnableServerless"
database_name = "database"
container_name = "Container"
partition_key_path = "/ContainerId"

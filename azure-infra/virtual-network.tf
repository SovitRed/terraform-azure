resource "azurerm_resource_group" "rg-1" {
  name = "${var.resource_group_name}"
  location = "${var.resource_group_location}"
}
resource "azurerm_network_security_group" "sg" {
  name                = "${var.security_group_name}"
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
}

resource "azurerm_virtual_network" "vn" {
  name                = "${var.virtual_newtwork_name}"
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
  address_space       = ["${var.address_space}"]
  depends_on = [
    azurerm_resource_group.rg-1
  ]
}

  resource "azurerm_subnet" "public_subnet" {
    name                = "${var.subnet_name_1}"
    resource_group_name = azurerm_resource_group.rg-1.name
    virtual_network_name=  "${var.virtual_newtwork_name}"
    address_prefixes = ["${var.address_prefix_1}"]
  }
  
  resource "azurerm_subnet" "private_subnet" {
    name           = "${var.subnet_name_2}"
    resource_group_name = azurerm_resource_group.rg-1.name
    virtual_network_name=  "${var.virtual_newtwork_name}"
    address_prefixes = ["${var.address_prefix_2}"]
  }
  
  

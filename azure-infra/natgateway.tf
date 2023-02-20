resource "azurerm_public_ip" "publicip" {
  name                = "${var.nat_gateway_publicip}"
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
  allocation_method   = "${var.allocation_method}"
  }

resource "azurerm_nat_gateway" "nat-gateway" {
  name                = "${var.nat_gateway_name}"
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
  idle_timeout_in_minutes = "${var.nat_gateway_idle_timeout}"
}

resource "azurerm_subnet_nat_gateway_association" "private_subnet" {
  subnet_id      = azurerm_subnet.private_subnet.id
  nat_gateway_id = azurerm_nat_gateway.nat-gateway.id
}
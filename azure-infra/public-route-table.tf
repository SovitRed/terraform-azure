resource "azurerm_route_table" "route-table" {
  name                          = "${var.route_table_name}"
  location                      = azurerm_resource_group.rg-1.location
  resource_group_name           = azurerm_resource_group.rg-1.name
  disable_bgp_route_propagation = "${var.disable_bgp_route_propagation}"
}

resource "azurerm_route" "route" {
  name                = "${var.route_name}"
  resource_group_name = azurerm_resource_group.rg-1.name
  route_table_name    = "${var.route_table_name}"
  address_prefix      = "${var.route_prefixes}"
  next_hop_type       = "${var.route_nexthop_types}"
   
}

resource "azurerm_subnet_route_table_association" "public_subnet" {
  subnet_id      = azurerm_subnet.public_subnet.id
  route_table_id = azurerm_route_table.route-table.id
}

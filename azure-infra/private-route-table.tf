resource "azurerm_route_table" "private-route-table" {
  name                          = "${var.private-route_table_name}"
  location                      = azurerm_resource_group.rg-1.location
  resource_group_name           = azurerm_resource_group.rg-1.name
  disable_bgp_route_propagation = "${var.private-disable_bgp_route_propagation}"
  depends_on = [
    azurerm_resource_group.rg-1
  ]
}


resource "azurerm_route" "private-route" {
  name                = "${var.private-route_name}"
  resource_group_name = azurerm_resource_group.rg-1.name
  route_table_name    = "${var.private-route_table_name}"
  address_prefix      = "${var.private-route_prefixes}"
  next_hop_type       = "${var.private-route_nexthop_types}"
   
}

resource "azurerm_subnet_route_table_association" "private_subnet" {
  subnet_id      = azurerm_subnet.private_subnet.id
  route_table_id = azurerm_route_table.private-route-table.id
}
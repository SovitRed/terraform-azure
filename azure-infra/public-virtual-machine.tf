######################### public ip ###############################

resource "azurerm_public_ip" "public-ip" {
  name                    = "${var.azurerm_public_ip_name}"
  location                = azurerm_resource_group.rg-1.location
  resource_group_name     = azurerm_resource_group.rg-1.name
  allocation_method = "Dynamic"
  idle_timeout_in_minutes = "${var.idle_timeout_in_minutes}"
}
# Create Network Security Group and rule
resource "azurerm_network_security_group" "my_terraform_nsg" {
  name                = "${var.azurerm_network_security_group_name}"
  location            =  azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface" "network-interface" {
  name                = "${var.azure_network_interface_name}"
  location            = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name

  ip_configuration {
    name                          = "${var.ip_name}"
    subnet_id                     = azurerm_subnet.public_subnet.id
    private_ip_address_allocation = "${var.private_ip_address_allocation}"
    public_ip_address_id          = azurerm_public_ip.public-ip.id
    
  }
}
  resource "azurerm_ssh_public_key" "ssh-key" {
  name                = "${var.ssh_key_name}"
  resource_group_name = azurerm_resource_group.rg-1.name
  location            = azurerm_resource_group.rg-1.location
  public_key          = file("~/.ssh/id_rsa.pub")
}

resource "azurerm_linux_virtual_machine" "virtual-machine" {
  name                = "${var.azure_virtual_machine_name}"
  resource_group_name = azurerm_resource_group.rg-1.name
  location            = azurerm_resource_group.rg-1.location
  size                = "${var.size}"

  network_interface_ids = [
    azurerm_network_interface.network-interface.id,
  ]
   computer_name                   = "${var.computer_name}"
  admin_username                 = "${var.admin_username}"
  
  admin_ssh_key {
    username   = "${var.username}"
    public_key = file("/home/softobiz-risav/.ssh/id_rsa.pub")
  }
  os_disk {
    caching              = "${var.caching}"
    storage_account_type = "${var.storage_account_type}"
  }

  source_image_reference {
    publisher = "${var.image_publisher}"
    offer     = "${var.image_offer}"
    sku       = "${var.image_sku}"
    version   = "${var.image_version}"
  }
}

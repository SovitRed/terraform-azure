
resource "azurerm_cosmosdb_account" "cosmos-db" {
  name = "${var.cosmos_db_account_name}"
  location = azurerm_resource_group.rg-1.location
  resource_group_name = azurerm_resource_group.rg-1.name
   
  offer_type = "${var.offer_type}"
  kind = "${var.kind}"
  enable_automatic_failover = "${var.enable_automatic_failover}"

  geo_location {
    location = "${var.failover_location}"
    failover_priority = 0
   }
  consistency_policy {
    consistency_level = "${var.consistency_level}"
  }
 
   capabilities    {
    name = "EnableServerless"
  }
}
 
resource "azurerm_cosmosdb_sql_database" "db" {
  name = "${var.database_name}"
  resource_group_name = "${azurerm_cosmosdb_account.cosmos-db.resource_group_name}"
  account_name = "${azurerm_cosmosdb_account.cosmos-db.name}"
}
resource "azurerm_cosmosdb_sql_container" "container" {
  name = "${var.container_name}"
  resource_group_name = "${azurerm_cosmosdb_account.cosmos-db.resource_group_name}"
  account_name = "${azurerm_cosmosdb_account.cosmos-db.name}"
  database_name = "${azurerm_cosmosdb_sql_database.db.name}"
  partition_key_path = "${var.partition_key_path}"
}
provider "azurerm" {
features {}
}
resource "azurerm_resource_group" "rg" {
name = var.resource_group_name
location = var.location
}
resource "azurerm_service_plan" "asp" {
name = var.app_service_plan_name
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
os_type = "Linux"
sku_name = "F1" # Gratuit
}
resource "azurerm_linux_web_app" "webapp" {
name = var.webapp_name
location = azurerm_resource_group.rg.location
resource_group_name = azurerm_resource_group.rg.name
service_plan_id = azurerm_service_plan.asp.id
site_config {
always_on = false
}
}

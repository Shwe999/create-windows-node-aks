# Create a resource group
resource "azurerm_resource_group" "rg" {
  location = var.resource_group_location
  name     = var.resource_group_name
}

resource "azurerm_virtual_network" "vnet" {
  name                = "myvnet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.1.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefixes = ["10.1.0.0/24"]
  }
}

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-cluster99"
  location            = var.resource_group_location
  resource_group_name = var.resource_group_name
  dns_prefix          = "dnsforaks99"

  identity {
    type = "SystemAssigned"
  }

  default_node_pool {
    name           = "linuxnode99"
    vm_size        = "Standard_B2als_v2"
    node_count     = var.node_count_linux
    vnet_subnet_id = element(tolist(azurerm_virtual_network.vnet.subnet), 0).id
  }

  windows_profile {
    admin_username = var.admin_username
    admin_password = var.admin_password
  }

  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
  }
}

resource "azurerm_kubernetes_cluster_node_pool" "win" {
  name                  = "node1"
  kubernetes_cluster_id = azurerm_kubernetes_cluster.aks.id
  vm_size               = "Standard_B2als_v2"
  node_count            = var.node_count_windows
  os_type               = "Windows"
}
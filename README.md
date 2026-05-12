# Create an AKS cluster with Linux and Windows nodes using Terraform

## Overview & Deployed Resources
This project deploys an AKS cluster with default Linux node and Windows node using Terraform. The .tfstate file is then saved in a blob container.

## Resources
- azurerm_resource_group 
- azurerm_virtual_network 
- azurerm_kubernetes_cluster 
- azurerm_kubernetes_cluster_node_pool

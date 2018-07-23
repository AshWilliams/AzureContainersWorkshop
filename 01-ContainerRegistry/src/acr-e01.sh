#!/bin/sh

# Set bash variables for your environment
resourceGroupName=<resource-group-name>
location=<location>
containerRegistryName=<container-registry-name>

# Create a Resource Group
az group create --name $resourceGroupName --location $location

# Create an Azure Container Registry
az acr create --resource-group $resourceGroupName --name $containerRegistryName --sku Basic
#!/bin/sh

# Set bash variables for your environment
resourceGroupName=<resource-group-name>
containerName=hello-world

# Remove container
az container delete --resource-group $resourceGroupName --name $containerName --yes

# Verify deletion
az container list --resource-group $resourceGroupName --output table

# Remove the Resource Group
az group delete --resource-group $resourceGroupName --yes --no-wait
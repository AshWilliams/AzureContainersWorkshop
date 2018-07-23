#!/bin/sh

# Set bash variables for your environment
resourceGroupName=<resource-group-name>
containerName=hello-world

# Pull the container logs
az container logs --resource-group $resourceGroupName --name $containerName

# Attach output streams
az container attach --resource-group $resourceGroupName --name $containerName
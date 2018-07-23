#!/bin/sh

# Set bash variables for your environment
containerRegistryName=<container-registry-name>
containerImageName=dariuszporowski/hello-world

# Remove the image from local machine
docker rmi $containerRegistryName.azurecr.io/$containerImageName

# Remove the image from Azure Container Registry
az acr repository delete --name $containerRegistryName --repository $containerImageName --yes
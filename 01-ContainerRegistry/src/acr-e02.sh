#!/bin/sh

# Set bash variables for your environment
containerRegistryName=<container-registry-name>
servicePrincipalName=AcrServicePrincipal
servicePrincipalRole=contributor

# Obtain the full registry ID for subsequent command args
containerRegistryId=$(az acr show --name $containerRegistryName --query id --output tsv)

# Create a Service Principal and assign results to variables
servicePrincipalPassword=$(az ad sp create-for-rbac --name $servicePrincipalName --scopes $containerRegistryId --role $servicePrincipalRole --query password --output tsv)
servicePrincipalAppId=$(az ad sp show --id http://$servicePrincipalName --query appId --output tsv)

# Output the service principal's credentials
echo "Service Principal AppID: $servicePrincipalAppId"
echo "Service Principal Password: $servicePrincipalPassword"

# Log in to a registry
az acr login --name $containerRegistryName --username $servicePrincipalAppId --password $servicePrincipalPassword
#docker login $containerRegistryName.azurecr.io -u $servicePrincipalAppId -p $servicePrincipalPassword
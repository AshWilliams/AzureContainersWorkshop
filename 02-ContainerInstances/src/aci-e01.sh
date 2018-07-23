#!/bin/sh

# Set bash variables for your environment
resourceGroupName=<resource-group-name>
location=<location>
containerRegistryFullName=<azure-container-registry-name>.azurecr.io
containerImageName=dariuszporowski/hello-world
containerName=hello-world
servicePrincipalAppId=<service-principal-app-id>
servicePrincipalPassword=<service-principal-password>
dnsNameLabel=<dns-name-label>

# Create a Resource Group
az group create --name $resourceGroupName --location $location

# Deploy a Container
az container create --resource-group $resourceGroupName --name $containerName --image $containerRegistryFullName/$containerImageName --registry-login-server $containerRegistryFullName --registry-username $servicePrincipalAppId --registry-password $servicePrincipalPassword --dns-name-label $dnsNameLabel --ports 80 --environment-variables NAME=ACI

# Verify deployment progress
az container show --resource-group $resourceGroupName --name $containerName --query "{FQDN:ipAddress.fqdn,ProvisioningState:provisioningState,InstanceViewState:instanceView.state}" --out table

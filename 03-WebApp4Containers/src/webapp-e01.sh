#!/bin/sh

# Set bash variables for your environment
resourceGroupName=<resource-group-name>
location=<location>
appSvcPlanName=<app-service-plan-name>
webAppName=<web-app-name>
containerRegistryFullName=<azure-container-registry-name>.azurecr.io
containerImageName=dariuszporowski/hello-world
servicePrincipalAppId=<service-principal-app-id>
servicePrincipalPassword=<service-principal-password>

# Create a Resource Group
az group create --name $resourceGroupName --location $location

# Create an Azure App Service plan
az appservice plan create --name $appSvcPlanName --resource-group $resourceGroupName --sku B1 --is-linux

# Create a Web App
az webapp create --resource-group $resourceGroupName --plan $appSvcPlanName --name $webAppName --runtime "dotnetcore|2.0"

# Use a Docker image from a private registry
az webapp config container set --name $webAppName --resource-group $resourceGroupName --docker-custom-image-name $containerRegistryFullName/$containerImageName --docker-registry-server-url https://$containerRegistryFullName --docker-registry-server-user $servicePrincipalAppId --docker-registry-server-password $servicePrincipalPassword

# Set custom environment variables for the Web App
az webapp config appsettings set --name $webAppName --resource-group $resourceGroupName --settings NAME=WebApp

# Restart the Web App
az webapp restart --name $webAppName --resource-group $resourceGroupName

# Browse to the Web App
az webapp show --resource-group $resourceGroupName --name $webAppName --query "{FQDN:defaultHostName}" --out table
az webapp browse --resource-group $resourceGroupName --name $webAppName
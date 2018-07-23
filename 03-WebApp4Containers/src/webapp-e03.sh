#!/bin/sh

# Set bash variables for your environment
resourceGroupName=<resource-group-name>
appSvcPlanName=<app-service-plan-name>
webAppName=<web-app-name>

# Remove the Web App for Containers
az webapp delete --resource-group $resourceGroupName --name $webAppName

# Remove the App Service plan
az appservice plan delete --resource-group $resourceGroupName --name $appSvcPlanName --yes

# Remove the Resource Group
az group delete --resource-group $resourceGroupName --yes --no-wait
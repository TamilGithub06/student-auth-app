#!/bin/bash

# Azure Static Web Apps Deployment Script
# This script deploys the Angular student authentication app to Azure

set -e

echo "🚀 Starting Azure Static Web Apps Deployment..."
echo ""

# Configuration
RESOURCE_GROUP="student-auth-rg"
LOCATION="eastus"
APP_NAME="student-auth-app"
ENVIRONMENT="dev"

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "❌ Azure CLI is not installed. Please install it first."
    echo "   Visit: https://docs.microsoft.com/cli/azure/install-azure-cli"
    exit 1
fi

# Step 1: Login to Azure
echo "📝 Step 1: Logging in to Azure..."
az login --use-device-code

# Step 2: Create Resource Group
echo ""
echo "📝 Step 2: Creating Resource Group..."
az group create \
  --name $RESOURCE_GROUP \
  --location $LOCATION || echo "Resource group already exists"

# Step 3: Deploy Static Web App
echo ""
echo "📝 Step 3: Deploying Static Web App..."
az deployment group create \
  --name "${APP_NAME}-deployment" \
  --resource-group $RESOURCE_GROUP \
  --template-file infra/main.bicep \
  --parameters infra/parameters.json \
  --parameters environmentName=$ENVIRONMENT

# Step 4: Get deployment outputs
echo ""
echo "📝 Step 4: Getting deployment details..."
DEPLOYMENT_OUTPUT=$(az deployment group show \
  --name "${APP_NAME}-deployment" \
  --resource-group $RESOURCE_GROUP \
  --query "properties.outputs" -o json)

STATIC_WEB_APP_URL=$(echo $DEPLOYMENT_OUTPUT | jq -r '.staticWebAppUrl.value' 2>/dev/null || echo "pending")
STATIC_WEB_APP_NAME=$(echo $DEPLOYMENT_OUTPUT | jq -r '.staticWebAppName.value' 2>/dev/null || echo "")

# Step 5: Display results
echo ""
echo "✅ Deployment Complete!"
echo ""
echo "📊 Deployment Details:"
echo "   Resource Group: $RESOURCE_GROUP"
echo "   Location: $LOCATION"
echo "   App Name: $STATIC_WEB_APP_NAME"
if [ "$STATIC_WEB_APP_URL" != "pending" ] && [ "$STATIC_WEB_APP_URL" != "null" ]; then
    echo "   URL: https://${STATIC_WEB_APP_URL}"
else
    echo "   URL: https://${STATIC_WEB_APP_NAME}.azurestaticapps.net"
fi
echo ""
echo "🔗 Next Steps:"
echo "   1. Visit the URL above to see your app"
echo "   2. Configure your GitHub token in Azure Portal"
echo "   3. Enable CI/CD deployments"
echo ""
echo "📚 Documentation: https://docs.microsoft.com/azure/static-web-apps/"

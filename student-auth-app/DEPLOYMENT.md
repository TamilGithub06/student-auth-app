# Azure Static Web Apps Deployment Configuration

## staticwebapp.config.json

This file configures routing, authentication, and platform features for Azure Static Web Apps.

```json
{
  "routes": [
    {
      "route": "/*",
      "rewrite": "/index.html",
      "statusCode": 200
    }
  ],
  "navigationFallback": {
    "rewrite": "/index.html",
    "exclude": [
      "/images/*",
      "/css/*",
      "/api/*"
    ]
  },
  "mimeTypes": {
    ".json": "application/json",
    ".wasm": "application/wasm"
  }
}
```

## GitHub Actions Workflow

Create `.github/workflows/azure-static-web-apps-deploy.yml` for automated deployment.

## Prerequisites

1. GitHub repository with the code
2. Azure subscription
3. GitHub account connected to Azure

## Deployment Steps

1. Push code to GitHub
2. Azure Static Web Apps automatically builds and deploys
3. View live at: https://[your-app-name].azurestaticapps.net

## Environment Configuration

Build settings for Angular:
- Build Command: `npm run build`
- App Location: `/` (root)
- Output Location: `dist/student-auth-app`
- API Location: (optional for backend)

## Deployment Link Structure

After deployment:
- Production: https://[your-app-name].azurestaticapps.net
- Preview: https://[pull-request-number].[your-app-name].azurestaticapps.net

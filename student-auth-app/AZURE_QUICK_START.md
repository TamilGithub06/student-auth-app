# Azure Static Web Apps - Quick Start

## 🚀 Quick Deploy (5 minutes)

### 1. Login to Azure
```bash
az login
```

### 2. Create Static Web App
```bash
az staticwebapp create \
  --name student-auth-app \
  --resource-group student-auth-rg \
  --source https://github.com/YOUR_USERNAME/student-auth-app.git \
  --location eastus \
  --branch main \
  --app-location "student-auth-app" \
  --output-location "dist/student-auth-app" \
  --build-command "npm run build" \
  --github-token YOUR_GITHUB_TOKEN
```

### 3. Push to GitHub
```bash
git add .
git commit -m "Add Azure Static Web Apps configuration"
git push
```

## ✅ Deployment Files Included

- ✅ **staticwebapp.config.json** - Routing & security configuration
- ✅ **.github/workflows/azure-static-web-apps-deploy.yml** - CI/CD pipeline
- ✅ **DEPLOYMENT.md** - Detailed deployment info
- ✅ **AZURE_DEPLOYMENT_GUIDE.md** - Complete guide

## 📋 What Gets Deployed

- Angular app (production build)
- All static assets
- SPA routing configured
- Security headers enabled

## 🔗 Access Points

After deployment:
- **Production**: `https://student-auth-app.azurestaticapps.net`
- **Preview URLs**: One per pull request

## 💡 Key Features

- ✅ Free tier available
- ✅ Auto-scaling
- ✅ Global CDN
- ✅ Automatic HTTPS
- ✅ GitHub Actions CI/CD
- ✅ Pull request previews

## 📞 Need Help?

1. Check [AZURE_DEPLOYMENT_GUIDE.md](../AZURE_DEPLOYMENT_GUIDE.md)
2. View [staticwebapp.config.json](./staticwebapp.config.json)
3. Monitor deployments in Azure Portal

**Ready to deploy!** 🎉

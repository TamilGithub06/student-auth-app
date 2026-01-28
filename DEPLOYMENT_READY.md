# 🚀 Azure Static Web Apps Deployment - Ready to Deploy

## ✅ Pre-Deployment Checklist

- ✅ Angular app built successfully (`dist/student-auth-app/` created)
- ✅ `staticwebapp.config.json` configured
- ✅ GitHub Actions workflow ready (`.github/workflows/azure-static-web-apps-deploy.yml`)
- ✅ Bicep infrastructure template prepared (`infra/main.bicep`)
- ✅ GitHub repository pushed

---

## 🎯 Option 1: Quick Deploy via Azure Portal (Recommended for First-Time)

### Step 1: Go to Azure Portal
1. Navigate to [Azure Portal](https://portal.azure.com)
2. Click **Create a resource** button
3. Search for **"Static Web App"**
4. Click **Create**

### Step 2: Configure Basic Settings
Fill in the form:
- **Name**: `student-auth-app`
- **Resource Group**: Create new: `student-auth-rg`
- **Hosting Plan Type**: **Free** (sufficient for testing)
- **Region**: **East US** (or closest to you)

### Step 3: Add GitHub Details
- Click **Sign in with GitHub**
- Authorize Azure
- Select:
  - **Organization**: YOUR_USERNAME
  - **Repository**: `student-auth-app`
  - **Branch**: `main`

### Step 4: Configure Build Details
In the **Build Presets** section:
- **Preset**: Select **Angular**
- **App location**: `student-auth-app`
- **Output location**: `dist/student-auth-app`
- **Build command**: Auto-populated (usually `npm run build`)

### Step 5: Review and Create
- Click **Review + Create**
- Click **Create**

**⏳ Wait 5-10 minutes for the first deployment**

---

## 🎯 Option 2: Deploy via Azure CLI (Fastest)

### Prerequisites
```bash
# Install Azure CLI (if not already installed)
# https://docs.microsoft.com/cli/azure/install-azure-cli
```

### Step 1: Create Resource Group
```bash
az group create \
  --name student-auth-rg \
  --location eastus
```

### Step 2: Create Static Web App
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

### Step 3: Get Deployment Status
```bash
az staticwebapp show \
  --name student-auth-app \
  --resource-group student-auth-rg
```

---

## 🎯 Option 3: Deploy with Bicep Infrastructure (Advanced)

### Step 1: Login to Azure
```bash
az login
```

### Step 2: Create Resource Group
```bash
az group create \
  --name student-auth-rg \
  --location eastus
```

### Step 3: Deploy Bicep Template
```bash
cd /home/t/azuredev-dcd8/student-auth-app

az deployment group create \
  --name student-auth-deployment \
  --resource-group student-auth-rg \
  --template-file infra/main.bicep \
  --parameters infra/parameters.json
```

### Step 4: View Outputs
```bash
az deployment group show \
  --name student-auth-deployment \
  --resource-group student-auth-rg \
  --query "properties.outputs" -o json
```

---

## 🎯 Option 4: Use Deployment Script

### Run the automated deployment script:
```bash
cd /home/t/azuredev-dcd8/student-auth-app
./deploy.sh
```

The script will:
1. ✅ Check Azure CLI installation
2. ✅ Login to Azure
3. ✅ Create resource group
4. ✅ Deploy via Bicep
5. ✅ Display results

---

## 📍 After Deployment - Your App URL

Once deployed, your app will be available at:
```
https://student-auth-app-XXXXX.azurestaticapps.net
```

(The exact URL depends on your unique resource token)

To get your exact URL:
```bash
az staticwebapp show \
  --name student-auth-app \
  --resource-group student-auth-rg \
  --query "properties.defaultHostname" -o tsv
```

---

## 🔄 Continuous Deployment Setup

The GitHub Actions workflow is already configured in:
```
.github/workflows/azure-static-web-apps-deploy.yml
```

**What happens automatically:**
1. Push to `main` branch → Production deployment
2. Create pull request → Preview deployment at unique URL
3. Merge PR → Production updated
4. Close PR → Preview environment cleaned up

---

## 🛠️ Configuration Files Included

### 1. **staticwebapp.config.json**
- ✅ SPA routing (all routes → index.html)
- ✅ Security headers (CSP, X-Frame-Options, etc.)
- ✅ MIME type mappings
- ✅ API configuration (if needed)

### 2. **GitHub Actions Workflow**
- ✅ Automatic builds on push
- ✅ Tests and builds Angular app
- ✅ Deploys to Static Web Apps
- ✅ Creates PR preview environments

### 3. **Bicep Infrastructure**
- ✅ `infra/main.bicep` - Infrastructure definition
- ✅ `infra/parameters.json` - Deployment parameters

---

## 📊 Deployment Architecture

```
GitHub Repository
        ↓
  (Push to main)
        ↓
GitHub Actions Workflow
        ↓
  npm run build
        ↓
dist/student-auth-app
        ↓
Azure Static Web Apps
        ↓
✅ Live at: https://student-auth-app-XXXX.azurestaticapps.net
```

---

## ✨ Features After Deployment

- ✅ **Global CDN**: Fast content delivery worldwide
- ✅ **Automatic HTTPS**: SSL certificate managed by Azure
- ✅ **Auto-scaling**: Handles traffic spikes
- ✅ **Staging Environments**: PR preview deployments
- ✅ **Custom Domains**: Add your own domain (optional)
- ✅ **Role-based Access**: Control who can deploy

---

## 🔒 Security Features

Already configured in `staticwebapp.config.json`:
- ✅ **Content Security Policy (CSP)** - Prevents XSS attacks
- ✅ **X-Frame-Options** - Prevents clickjacking
- ✅ **X-Content-Type-Options** - Prevents MIME sniffing
- ✅ **X-XSS-Protection** - Browser XSS protection

---

## 💰 Pricing

**Azure Static Web Apps - Free Tier:**
- ✅ 1 static web app
- ✅ 100 GB bandwidth per month
- ✅ 1 GB storage
- ✅ Free custom domain
- ✅ Free SSL certificate
- ✅ No credit card required for 12 months

**When to upgrade:**
- Need more than 1 app
- Need more bandwidth
- Need larger storage

---

## 📞 Troubleshooting

### Build Fails
```bash
# Check build logs
az staticwebapp deployment list-all \
  --name student-auth-app \
  --resource-group student-auth-rg
```

### 404 on Routes
**Solution**: Already configured in `staticwebapp.config.json`
- SPA routing automatically redirects to index.html

### CORS Issues
Edit `staticwebapp.config.json`:
```json
"globalHeaders": [
  {
    "headerName": "Access-Control-Allow-Origin",
    "headerValue": "https://yourdomain.com"
  }
]
```

---

## 🚀 Next Steps

1. **Choose deployment option** (1-4 above)
2. **Run deployment**
3. **Wait for completion** (5-10 minutes first deployment)
4. **Access your live app**
5. **Test login and signup flows**
6. **(Optional) Add custom domain**

---

## 📚 Useful Commands

```bash
# Get deployment status
az staticwebapp show \
  --name student-auth-app \
  --resource-group student-auth-rg

# List deployments
az staticwebapp deployment list-all \
  --name student-auth-app \
  --resource-group student-auth-rg

# Get app URL
az staticwebapp show \
  --name student-auth-app \
  --resource-group student-auth-rg \
  --query "properties.defaultHostname" -o tsv

# Delete (cleanup)
az staticwebapp delete \
  --name student-auth-app \
  --resource-group student-auth-rg
```

---

## 📖 Additional Resources

- [Azure Static Web Apps Documentation](https://docs.microsoft.com/azure/static-web-apps/)
- [Angular Deployment Guide](https://angular.io/guide/deployment)
- [GitHub Actions Documentation](https://docs.github.com/actions)
- [Azure CLI Reference](https://docs.microsoft.com/cli/azure/)

---

**🎉 Your application is ready for deployment!**

Choose one of the options above and deploy now! 🚀

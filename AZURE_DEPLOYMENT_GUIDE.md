# Azure Static Web Apps Deployment Guide

## Complete Step-by-Step Deployment Instructions

### Prerequisites
- ✅ Azure subscription ([Create free account](https://azure.microsoft.com/free/))
- ✅ GitHub account
- ✅ Azure CLI installed (`az` command)
- ✅ Node.js 18+ installed

---

## Step 1: Prepare Your GitHub Repository

### Option A: Using Existing Repository
```bash
cd /home/t/azuredev-dcd8
git init
git add .
git commit -m "Initial commit: Student Auth App"
git branch -M main
git remote add origin https://github.com/YOUR_USERNAME/student-auth-app.git
git push -u origin main
```

### Option B: Fork or Create New Repository
1. Go to [GitHub.com](https://github.com)
2. Create new repository: `student-auth-app`
3. Push your code to the repository

---

## Step 2: Login to Azure

```bash
# Login to Azure
az login

# Set default subscription (if you have multiple)
az account set --subscription "YOUR_SUBSCRIPTION_NAME"
```

---

## Step 3: Create Azure Static Web App

### Using Azure CLI:
```bash
# Create Resource Group
az group create \
  --name student-auth-rg \
  --location eastus

# Create Static Web App
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

### Using Azure Portal:
1. Go to [Azure Portal](https://portal.azure.com)
2. Click **Create a resource** → Search **Static Web App**
3. Click **Create**
4. Fill in:
   - **Name**: `student-auth-app`
   - **Resource Group**: Create new `student-auth-rg`
   - **Plan type**: Free
   - **Region**: East US
5. Click **Sign in with GitHub**
6. Authorize Azure
7. Select:
   - **Organization**: Your GitHub username
   - **Repository**: `student-auth-app`
   - **Branch**: `main`
8. In **Build Details**:
   - **App location**: `student-auth-app`
   - **Output location**: `dist/student-auth-app`
9. Click **Review + Create** → **Create**

---

## Step 4: Configure Build Settings

Azure Static Web Apps will automatically detect your configuration. Verify:

**Build Preset**: Angular (auto-detected)
**App location**: `/` or `student-auth-app`
**Output location**: `dist/student-auth-app`
**Build command**: `npm run build` (auto-generated)

---

## Step 5: GitHub Actions Setup

The workflow file is already configured at:
`.github/workflows/azure-static-web-apps-deploy.yml`

**What it does:**
- Triggers on push to `main` branch
- Installs dependencies
- Builds Angular app
- Deploys to Azure Static Web Apps
- Creates preview deployments for PRs

---

## Step 6: Monitor Deployment

### View Deployment Status:
```bash
# Get Static Web App details
az staticwebapp show \
  --name student-auth-app \
  --resource-group student-auth-rg

# Get deployment details
az staticwebapp deployment function list \
  --name student-auth-app \
  --resource-group student-auth-rg
```

### Check in Azure Portal:
1. Go to [Azure Portal](https://portal.azure.com)
2. Search: `student-auth-app`
3. Click your Static Web App
4. View **Deployments** tab

---

## Step 7: Access Your App

Once deployed:

**Production URL**: `https://student-auth-app.azurestaticapps.net`

Replace `student-auth-app` with your actual resource name.

---

## Step 8: Custom Domain (Optional)

### Add Custom Domain:
```bash
az staticwebapp custom-domain create \
  --name student-auth-app \
  --resource-group student-auth-rg \
  --domain-name your-domain.com \
  --validation-type cname
```

Or via Azure Portal:
1. Static Web App → **Custom domains**
2. Click **+ Add**
3. Enter your domain
4. Follow DNS configuration steps

---

## Step 9: Environment Configuration

### Add Environment Variables:
```bash
# Set environment variables
az staticwebapp appsettings set \
  --name student-auth-app \
  --resource-group student-auth-rg \
  --setting-names API_URL=https://api.example.com
```

Or via Portal:
1. Static Web App → **Configuration**
2. Add application settings

---

## Step 10: CI/CD Pipeline Features

### Automatic Preview Deployments:
- Every pull request gets a unique URL
- Staging environment for testing
- Automatic cleanup on PR closure

### Automatic Production Deployment:
- Merged PRs trigger production build
- Zero-downtime deployment
- Automatic rollback on errors

---

## Troubleshooting

### Build Fails
```bash
# Check build logs
az staticwebapp deployment list-all \
  --name student-auth-app \
  --resource-group student-auth-rg
```

### Issues with staticwebapp.config.json
- File must be in root of `student-auth-app` folder
- Syntax must be valid JSON
- Check console for errors

### CORS Issues
- Update `staticwebapp.config.json` with proper headers
- Configure API endpoint properly

### 404 on Routes
- SPA routing already configured in `staticwebapp.config.json`
- Routes fallback to `index.html` automatically

---

## Useful Commands

```bash
# View app details
az staticwebapp show --name student-auth-app --resource-group student-auth-rg

# View deployments
az staticwebapp deployment list-all --name student-auth-app --resource-group student-auth-rg

# Delete app
az staticwebapp delete --name student-auth-app --resource-group student-auth-rg

# Check app status
az staticwebapp show --name student-auth-app --resource-group student-auth-rg --query "{name: name, status: properties.buildStatus}"
```

---

## Security Best Practices

✅ **Already Configured:**
- CSP headers for XSS protection
- X-Frame-Options to prevent clickjacking
- X-Content-Type-Options to prevent MIME sniffing
- X-XSS-Protection enabled

✅ **Next Steps:**
- Enable HTTPS (automatic with Azure)
- Use environment variables for API keys
- Implement authentication with Azure AD
- Regular security updates

---

## Performance Optimization

✅ **Static Web Apps provides:**
- Global CDN (Content Delivery Network)
- Automatic compression
- HTTP/2 support
- Caching optimization

✅ **For Angular:**
- Production builds enabled
- Tree-shaking optimizations
- Lazy loading for routes
- Code splitting automatic

---

## Monitoring & Logging

### Enable Monitoring:
```bash
# Create App Insights
az monitor app-insights component create \
  --app student-auth-app \
  --location eastus \
  --resource-group student-auth-rg \
  --application-type web
```

### View Analytics:
1. Portal → Static Web App → **Monitoring**
2. View requests, errors, performance metrics

---

## Next Steps

1. ✅ Test deployment in production
2. ✅ Set up custom domain
3. ✅ Add monitoring and alerts
4. ✅ Configure backend API (if needed)
5. ✅ Implement authentication
6. ✅ Set up automated tests

---

## Support

- [Azure Static Web Apps Documentation](https://docs.microsoft.com/en-us/azure/static-web-apps/)
- [Angular Deployment Guide](https://angular.io/guide/deployment)
- [GitHub Actions Documentation](https://docs.github.com/en/actions)

---

**Deployment Ready!** 🚀

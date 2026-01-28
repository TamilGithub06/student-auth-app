# ⚡ Deploy in 3 Steps

## Step 1: Azure CLI Command (Copy & Paste)

```bash
# Replace YOUR_USERNAME with your GitHub username
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

**OR via Portal**: [Portal → Create Resource → Static Web App](https://portal.azure.com)

---

## Step 2: Monitor Deployment

```bash
# Check status
az staticwebapp show \
  --name student-auth-app \
  --resource-group student-auth-rg
```

**OR** visit Azure Portal and watch the deployments tab

---

## Step 3: Access Your App

```
https://student-auth-app-XXXXX.azurestaticapps.net
```

Get your exact URL:
```bash
az staticwebapp show \
  --name student-auth-app \
  --resource-group student-auth-rg \
  --query "properties.defaultHostname" -o tsv
```

---

## ✅ Everything is Ready!

| Item | Status |
|------|--------|
| Angular Build | ✅ `dist/student-auth-app/` |
| GitHub Workflow | ✅ `.github/workflows/` |
| SPA Config | ✅ `staticwebapp.config.json` |
| Infrastructure | ✅ `infra/` (Bicep) |
| Deployment Scripts | ✅ `deploy.sh` |
| Documentation | ✅ See below |

---

## 📖 Documentation

- **[DEPLOYMENT_READY.md](DEPLOYMENT_READY.md)** - Full deployment guide with 4 options
- **[AZURE_DEPLOYMENT_GUIDE.md](AZURE_DEPLOYMENT_GUIDE.md)** - Detailed step-by-step
- **[student-auth-app/AZURE_QUICK_START.md](student-auth-app/AZURE_QUICK_START.md)** - Quick reference

---

## 🎯 One-Line Deploy

```bash
cd /home/t/azuredev-dcd8/student-auth-app && ./deploy.sh
```

---

**That's it! Your app will be live in 5-10 minutes! 🚀**

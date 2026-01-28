param location string = resourceGroup().location
param environmentName string
param projectName string = 'student-auth-app'

var resourceToken = uniqueString(resourceGroup().id)
var appName = '${projectName}-${environmentName}-${resourceToken}'

resource staticWebApp 'Microsoft.Web/staticSites@2022-03-01' = {
  name: appName
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    repositoryUrl: 'https://github.com/YOUR_USERNAME/student-auth-app'
    branch: 'main'
    repositoryToken: ''
    buildProperties: {
      appLocation: 'student-auth-app'
      outputLocation: 'dist/student-auth-app'
      appBuildCommand: 'npm run build'
    }
  }
}

output staticWebAppUrl string = staticWebApp.properties.defaultHostname
output staticWebAppId string = staticWebApp.id
output staticWebAppName string = staticWebApp.name

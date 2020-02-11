# Provision a web application in GitHub with automatic deployment to Azure

## Usage:
Provision.ps1 -RepositoryName "Test" -GitHubUserName "NielsNijveldt" -AzureUserName "nnijveldt@xpirit.com" -AzurePassword $password -AzureResourceGroup "testresource" -AzureApplicationName "myprovisionedwebapptest"

$password should be a [securestring](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.security/convertto-securestring?view=powershell-7) 

Also add a generated GitHub API token in the Authentication.ps1

## Todo
- Improve app name placement in yml file for deployment
- Use publishing profile for deployment
- Get Sodium from package(?)
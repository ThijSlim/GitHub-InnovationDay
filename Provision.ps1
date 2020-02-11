param (
    [string] $RepositoryName,
    [string] $GitHubUserName,
    [string] $AzureUserName,
    [securestring] $AzurePassword,
    [string] $AzureResourceGroup,
    [string] $AzureApplicationName
)

Import-module .\Authentication.ps1 -Force

.\Create-Repo.ps1 -RepsitoryName $RepositoryName
.\Create-AzureResources.ps1 -AzureUserName $AzureUserName -AzurePassword $AzurePassword -AzureResourceGroup $AzureResourceGroup -AzureApplicationName $AzureApplicationName -GitHubUserName $GitHubUserName -GitHubRepository $RepositoryName
#.\Add-CollaboratorsToRepo.ps1 -Username $GitHubUserName -RepositoryName $RepositoryName -Collaborator "<Collaborator Name>"
.\Add-ApplicationNameToYml.ps1 -ApplicationName $AzureApplicationName
.\Add-CodeToRepo.ps1 -Owner $GitHubUserName -RepositoryName $RepositoryName
.\Add-Issue.ps1 -Owner $GitHubUserName -RepsitoryName $RepositoryName
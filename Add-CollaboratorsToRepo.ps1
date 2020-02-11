param (
    [string] $Username,
    [string] $RepositoryName,
    [string] $Collaborator
)

$AddCollaboratorGithubUri = "https://api.github.com/repos/$Username/$RepositoryName/collaborators/$Collaborator";

$Body = @{
    permission = "admin"
}

$Header = GetBasicAuthenticationHeader

$Response = Invoke-RestMethod -Uri $AddCollaboratorGithubUri -Headers @{Authorization = $Header} -ContentType "application/json" -Method Put -Body (ConvertTo-Json $Body)

Write-Output $Response
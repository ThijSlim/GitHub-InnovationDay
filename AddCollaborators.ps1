Import-module .\Authentication.ps1 -Force

$username = "thijslimmen"
$repository = "Gdbc2020-InnovationDay"
$collaborator = "NielsNijveldt"

$addCollaboratorGithubUri = "https://api.github.com/repos/$username/$repository/collaborators/$collaborator";

$body = @{
    permission = "admin"
}

$header = GetBasicAuthenticationHeader

$response = Invoke-RestMethod -Uri $addCollaboratorGithubUri -Headers @{Authorization = $header} -ContentType "application/json" -Method Put -Body (ConvertTo-Json $body)

Write-Output $response
Import-module .\Authentication.ps1 -Force

$createRepoGithubUri = "https://api.github.com/user/repos";

$body = @{
    name = "Gdbc2020-InnovationDay"
    private = $true
}

$header = GetBasicAuthenticationHeader

$response = Invoke-RestMethod -Uri $createRepoGithubUri -Headers @{Authorization = $header} -ContentType "application/json" -Method Post -Body (ConvertTo-Json $body)

Write-Output $response

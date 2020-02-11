param (
    [string] $RepsitoryName
)

$CreateRepoGithubUri = "https://api.github.com/user/repos";

$Body = @{
    name = $RepsitoryName
    private = $true
}

$Header = GetBasicAuthenticationHeader

$Response = Invoke-RestMethod -Uri $CreateRepoGithubUri -Headers @{Authorization = $Header} -ContentType "application/json" -Method Post -Body (ConvertTo-Json $Body)

Write-Output $Response

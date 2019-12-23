param (
    [string] $repoName
)

$createRepoGithubUri = "https://api.github.com/user/repos";

$body = @{
    name = $repoName
    private = $true
}

$header = GetBasicAuthenticationHeader

$response = Invoke-RestMethod -Uri $createRepoGithubUri -Headers @{Authorization = $header} -ContentType "application/json" -Method Post -Body (ConvertTo-Json $body)

Write-Output $response

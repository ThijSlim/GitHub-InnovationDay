param (
    [string] $owner,
    [string] $repo
)

$addIssueGithubUri = "https://api.github.com/repos/$owner/$repo/issues";

$body = @{
    title = "Doesn't work on my machine"
    body = "Fix it!"
    assignee = $owner
}

$header = GetBasicAuthenticationHeader

$response = Invoke-RestMethod -Uri $addIssueGithubUri -Headers @{Authorization = $header} -ContentType "application/json" -Method Post -Body (ConvertTo-Json $body)

Write-Output $response

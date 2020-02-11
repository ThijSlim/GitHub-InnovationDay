param (
    [string] $Owner,
    [string] $RepsitoryName
)

$AddIssueGithubUri = "https://api.github.com/repos/$Owner/$RepsitoryName/issues";

$Body = @{
    title = "Doesn't work on my machine"
    body = "Fix it!"
    assignee = $Owner
}

$Header = GetBasicAuthenticationHeader

$Response = Invoke-RestMethod -Uri $AddIssueGithubUri -Headers @{Authorization = $Header} -ContentType "application/json" -Method Post -Body (ConvertTo-Json $Body)

Write-Output $Response

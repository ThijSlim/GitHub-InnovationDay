param (
    [string] $Owner,
    [string] $RepositoryName
)

$CreateRepoGithubUri = "https://api.github.com/repos/$Owner/$RepositoryName";

$TempDirectory = $PSScriptRoot + "/bin/temp"
$PartsUnlimitedDirectory = $PSScriptRoot + "/PartsUnlimited"
$GithubActionsDirectory = $PSScriptRoot + "/GithubActions"

$Header = GetBasicAuthenticationHeader

$Response = Invoke-RestMethod -Uri $CreateRepoGithubUri -Headers @{Authorization = $Header} -ContentType "application/json" -Method Get -Body (ConvertTo-Json $Body)

$GitUrl = $Response.clone_url

Push-Location $TempDirectory
git clone $GitUrl
Pop-Location

Remove-Item "$TempDirectory\$Repo\.github" -Force -Recurse -ErrorAction Ignore
Remove-Item "$TempDirectory\$Repo\PartsUnlimited" -Recurse -Force -ErrorAction Ignore

# TODO: Clone files from source repo -> Copy to destination -> Commit to target repo
Copy-Item -Recurse -Path "$PartsUnlimitedDirectory" -Destination "$TempDirectory\$RepositoryName" -Force 
Copy-Item -Recurse -Path "$GithubActionsDirectory" -Destination "$TempDirectory\$RepositoryName\.github\workflows" -Force 

Push-Location "$TempDirectory\$RepositoryName"
git add .
git commit -m "Init commit"
git push
Pop-Location

Remove-Item "$TempDirectory\$RepositoryName\.github" -Recurse -Force -ErrorAction Ignore
Remove-Item $TempDirectory\$RepositoryName -Recurse -Force -ErrorAction Ignore
Import-module .\Authentication.ps1 -Force

$owner = "thijslimmen"
$repo = "test"
$createRepoGithubUri = "https://api.github.com/repos/$owner/$repo";

$tempDirectory = $PSScriptRoot + "/bin/temp"
$partsUnlimitedDirectory = $PSScriptRoot + "/PartsUnlimited"
$githubActionsDirectory = $PSScriptRoot + "/GithubActions"

$header = GetBasicAuthenticationHeader

$response = Invoke-RestMethod -Uri $createRepoGithubUri -Headers @{Authorization = $header} -ContentType "application/json" -Method Get -Body (ConvertTo-Json $body)

$gitUrl = $response.clone_url

Push-Location $tempDirectory
git clone $gitUrl
Pop-Location

Remove-Item "$tempDirectory\$repo\.github" -Force -Recurse -ErrorAction Ignore
Remove-Item "$tempDirectory\$repo\PartsUnlimited" -Recurse -Force -ErrorAction Ignore

# TODO: Clone files from source repo -> Copy to destination -> Commit to target repo
Copy-Item -Recurse -Path "$partsUnlimitedDirectory" -Destination "$tempDirectory\$repo" -Force 
Copy-Item -Recurse -Path "$githubActionsDirectory" -Destination "$tempDirectory\$repo\.github\workflows" -Force 

Push-Location "$tempDirectory\$repo"
git add .
git commit -m "Init commit"
git push
Pop-Location

Remove-Item "$tempDirectory\$repo\.github" -Recurse -Force -ErrorAction Ignore
Remove-Item $tempDirectory\$repo -Recurse -Force -ErrorAction Ignore
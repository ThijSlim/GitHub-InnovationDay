Import-module .\Authentication.ps1 -Force

$owner = "thijslimmen"
$repo = "Test"
$createRepoGithubUri = "https://api.github.com/repos/$owner/$repo";
$tempDirectory = $PSScriptRoot + "/bin/temp"

$header = GetBasicAuthenticationHeader

$response = Invoke-RestMethod -Uri $createRepoGithubUri -Headers @{Authorization = $header} -ContentType "application/json" -Method Get -Body (ConvertTo-Json $body)

$gitUrl = $response.clone_url

Push-Location $tempDirectory
git clone $gitUrl
Pop-Location

Remove-Item "$tempDirectory\$repo\.github" -Force -Recurse
Remove-Item "$tempDirectory\$repo\PartsUnlimited" -Recurse -Force

# TODO: Clone files from source repo -> Copy to destination -> Commit to target repo
Copy-Item -Recurse -Path "$tempDirectory\PartsUnlimited" -Destination "$tempDirectory\$repo" -Force 
Copy-Item -Recurse -Path "$tempDirectory\GithubActions" -Destination "$tempDirectory\$repo\.github\workflows" -Force 

Push-Location "$tempDirectory\$repo"
git add .
git commit -m "Init commit"
git push
Pop-Location

Remove-Item "$tempDirectory\$repo\.github" -Recurse -Force
Remove-Item $tempDirectory\$repo -Recurse -Force
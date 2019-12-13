Import-module .\Authentication.ps1 -Force

$owner = "thijslimmen"
$repo = "Test"
$createRepoGithubUri = "https://api.github.com/repos/$owner/$repo";
$tempDirectory = "c:\temp"

$header = GetBasicAuthenticationHeader

$response = Invoke-RestMethod -Uri $createRepoGithubUri -Headers @{Authorization = $header} -ContentType "application/json" -Method Get -Body (ConvertTo-Json $body)

$gitUrl = $response.clone_url

Push-Location $tempDirectory
git clone $gitUrl
Pop-Location

# TODO: Clone files from source repo -> Copy to destination -> Commit to target repo
Copy-Item -Recurse -Path "C:\Test\PartsUnlimited" -Destination "$tempDirectory\$repo" -Force 

Push-Location "$tempDirectory\$repo"
git add .
git commit -m "Init commit"
git push
Pop-Location
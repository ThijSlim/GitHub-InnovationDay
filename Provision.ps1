Import-module .\Authentication.ps1 -Force

$repo = "<RepoName>"
$userName = "<UserName Owner>"

# TODO Create Azure Web APP
# TODO Get Azure Publish package
.\Create-Repo.ps1 -RepoName $repo
# TODO Add Azure Publish package as secret
.\Add-CollaboratorsToRepo.ps1 -Username $userName -Repository $repo -Collaborator "<Collaborator Name>"
.\Add-CodeToRepo.ps1 -Owner $userName -Repo $repo
.\Add-Issue.ps1 -Owner $userName -Repo $repo
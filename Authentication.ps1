$PersonalAccessToken = "<GithubToken>";

function GetBasicAuthenticationHeader(){
    $CredPair = "username:$PersonalAccessToken"
 
    # Step 2. Encode the pair to Base64 string
    $EncodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($CredPair))
    
    # Step 3. Form the header and add the Authorization attribute to it
    return "Basic $EncodedCredentials";
}
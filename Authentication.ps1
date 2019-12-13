$personalAccessToken = "68b4a68fec50fe2e0c4cf76aa0511c0c3414adde";

function GetBasicAuthenticationHeader(){
    $credPair = "username:$personalAccessToken"
 
    # Step 2. Encode the pair to Base64 string
    $encodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($credPair))
    
    # Step 3. Form the header and add the Authorization attribute to it
    return "Basic $encodedCredentials";
}
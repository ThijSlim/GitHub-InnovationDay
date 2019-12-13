$personalAccessToken = "67fcc95fbdbaec8f480651b7d315d5785b480a63";

function GetBasicAuthenticationHeader(){
    $credPair = "username:$personalAccessToken"
 
    # Step 2. Encode the pair to Base64 string
    $encodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($credPair))
    
    # Step 3. Form the header and add the Authorization attribute to it
    return "Basic $encodedCredentials";
}
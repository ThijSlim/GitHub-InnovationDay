$personalAccessToken = "793ee08f331a429749a755b780613d12a04c258e";

function GetBasicAuthenticationHeader(){
    $credPair = "username:$personalAccessToken"
 
    # Step 2. Encode the pair to Base64 string
    $encodedCredentials = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes($credPair))
    
    # Step 3. Form the header and add the Authorization attribute to it
    return "Basic $encodedCredentials";
}
#Token Generation 

$tenantid = "45e38fc7-be2e-4e13-983b-c81bac62d5cd"

$clientid = "c0f60f0e-60ec-45e2-839c-0c5dc512baf1"

$clientsecret = "l4g8Q~IQL5_Qkom-6a8FDeTtL1fVbdGBqhaKLc5f"

$body = @{
    grant_type    = "client_credentials" # it is telling an Application Auth itself not a user loggin-in
    client_id     = $clientid
    client_secret = $clientsecret
    scope         = "https://graph.microsoft.com/.default"
}
$token = Invoke-RestMethod -Method Post -Uri "https://login.microsoftonline.com/$tenantid/oauth2/v2.0/token" -Body $body
$headers = @{ Authorization = "Bearer $($token.access_token)"; "Content-Type" = "application/json" }

Write-Host "Token acquired successfully. Expires in $($token.expires_in) seconds."
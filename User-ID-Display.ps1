#User-ID-Display
$userUPN = "trainer1@ajaykumarbk75gmail.onmicrosoft.com"

$user = Invoke-RestMethod `
    -Uri "https://graph.microsoft.com/v1.0/users/$userUPN?`$select=id,displayName,userPrincipalName" `
    -Headers $headers

$user | Format-List
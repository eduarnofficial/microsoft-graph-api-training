#Check if a user account is enabled
$u = Invoke-RestMethod -Uri "https://graph.microsoft.com/v1.0/users/user1@ajaykumarbk75gmail.onmicrosoft.com?`$select=accountEnabled" -Headers $headers
$u.accountEnabled

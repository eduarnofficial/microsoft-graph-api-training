#Duplicate_users_Email_find

$users = Invoke-RestMethod `
    -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayName,userPrincipalName,mail" `
    -Headers $headers

# Find duplicate email addresses
$duplicates = $users.value |
    Group-Object userPrincipalName |
    Where-Object { $_.Count -gt 1 } |
    Select-Object Name, Count

# Display duplicate emails
$duplicates

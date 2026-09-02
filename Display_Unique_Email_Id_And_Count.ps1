#Display_Unique_Email_Id_And_Count

$users = Invoke-RestMethod `
    -Uri "https://graph.microsoft.com/v1.0/users?`$select=displayName,userPrincipalName" `
    -Headers $headers


#Group Users By email address
$emailGroups = $users.value |
   Group-Object userPrincipalName 


# Display duplicate email Addresses
Write-Host "Duplicate Email Addresses"
$emailGroups |
    Where-Object { $_.Count -gt 1 } |
    Select-Object Name, Count 

# Display unique email Addresses
Write-Host "Unique Email Addresses"
$emailGroups |
    Where-Object { $_.Count -eq 1 } |
    Select-Object Name, Count 

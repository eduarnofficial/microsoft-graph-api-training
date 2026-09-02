# Update_Contact-Details-
$userUPN = "trainer1@ajaykumarbk75gmail.onmicrosoft.com"

#New Contact Information 
$updateBody = @{

    mobilePhone = "+91 9876543210"
    officeLocation = "Chennai"
    jobTitle      = "Senior Software Engineer"
    department = "Engineering"
} | ConvertTo-Json

#Update user information
Invoke-RestMethod `
    -Method PATCH `
    -Uri "https://graph.microsoft.com/v1.0/users/$userUPN" `
    -Headers $headers `
    -Body $updateBody

Write-Host "User infromation updated successfully."
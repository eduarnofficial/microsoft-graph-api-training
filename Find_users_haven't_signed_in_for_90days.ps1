# Update_user_details
$upn = "user1@ajaykumarbk75gmail.onmicrosoft.com"

$patch = @{
    jobTitle       = "DevOps Engineer"
    department     = "IT Operations"
    officeLocation = "Bangalore"
    mobilePhone    = "+91-9876543210"
    city           = "Bangalore"
    country        = "India"
} | ConvertTo-Json

try {
    Invoke-RestMethod -Method Patch -Uri "https://graph.microsoft.com/v1.0/users/$upn" -Headers $headers -Body $patch
    Write-Host "PATCH request sent successfully." -ForegroundColor Green
}
catch {
    Write-Warning "PATCH failed: $($_.Exception.Message)"
    Write-Warning "Status code: $($_.Exception.Response.StatusCode.value__)"
}

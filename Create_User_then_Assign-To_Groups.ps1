#Create_User_then_Assign-To_Groups
$newHires = Import-Csv -Path "$env:USERPROFILE\Desktop\ABC_NewHires.csv"
$deptGroupMap = @{
    "Engineering" = "ccba070e-a46d-4a1c-aa9f-b3c6b50f749f"
}

foreach ($hire in $newHires) {
    $upn = "$($hire.FirstName)$($hire.LastName)@ajaykumarbk75gmail.onmicrosoft.com".ToLower()
    $displayName = "$($hire.FirstName) $($hire.LastName)"

    # Step 1: create user
    $userBody = @{
        accountEnabled    = $true
        displayName       = $displayName
        mailNickname      = "$($hire.FirstName)$($hire.LastName)".ToLower()
        userPrincipalName = $upn
        jobTitle          = $hire.JobTitle
        department        = $hire.Department.Trim()
        usageLocation     = "IN"
        passwordProfile   = @{ forceChangePasswordNextSignIn = $true; password = "Welcome@ABC2026" }
    } | ConvertTo-Json

    try {
        Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users" -Headers $headers -Body $userBody | Out-Null
        Write-Host "[CREATED] $upn" -ForegroundColor Green
    } catch {
        Write-Warning "[CREATE FAILED] $upn : $($_.Exception.Message)"
        continue  # skip group assignment if user creation failed
    }

    # Step 2: assign to group
    $groupId = $deptGroupMap[$hire.Department.Trim()]
    if ($groupId) {
        $addMemberBody = @{ "@odata.id" = "https://graph.microsoft.com/v1.0/users/$upn" } | ConvertTo-Json
        try {
            Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/groups/$groupId/members/`$ref" -Headers $headers -Body $addMemberBody
            Write-Host "[GROUP ADDED] $upn -> $($hire.Department)" -ForegroundColor Cyan
        } catch {
            Write-Warning "[GROUP FAILED] $upn : $($_.Exception.Message)"
        }
    }
}
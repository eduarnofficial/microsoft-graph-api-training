#Bulk_create_users_from_CSV

$newHires = Import-Csv -Path "$env:USERPROFILE\Desktop\ABC_NewHires.csv"
$deptGroupMap = @{
    "Engineering" = "ccba070e-a46d-4a1c-aa9f-b3c6b50f749f"  # AI-Eng-Groups
}

foreach ($hire in $newHires) {
    $upn = "$($hire.FirstName)$($hire.LastName)@ajaykumarbk75gmail.onmicrosoft.com".ToLower()
    $groupId = $deptGroupMap[$hire.Department.Trim()]
    if ($groupId) {
        $addMemberBody = @{ "@odata.id" = "https://graph.microsoft.com/v1.0/users/$upn" } | ConvertTo-Json
        try {
            Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/groups/$groupId/members/`$ref" -Headers $headers -Body $addMemberBody
            Write-Host "[GROUP ADDED] $upn -> $($hire.Department)" -ForegroundColor Green
        } catch {
            Write-Warning "[FAILED] $upn : $($_.Exception.Message)"
        }
    }
}
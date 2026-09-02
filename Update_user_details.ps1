# Mini-Project-1:
#Scenario 1: New Employee Onboarding:
#Business context: ABC Corp's HR team sends a CSV every Monday listing new hires starting that week. IT currently creates each account manually — takes ~15 minutes per person, and mistakes happen (wrong department, missing manager link).

#Goal: One script reads the CSV and provisions every account correctly, first try.

#case 1. Create the input CSV (simulating what HR would send)

$csvContent = @"
FirstName, LastName, JobTitle, Department,ManagerUPN
Ravi,Kumar, Software Engineer, Engineering, trainer1@ajaykumarbk75gmail.onmicrosoft.com
Priya,Sharma, QA Analyst, Engineering, trainer1@ajaykumarbk75gmail.onmicrosoft.com 
"@
$csvContent | Out-File -FilePath "$env:USERPROFILE\Desktop\ABC_NewHires.csv" -Encoding UTF8
Write-Host "Sample HR File Created."


#2. The onboarding automation script

$newHires = Import-Csv -Path "$env:USERPROFILE\Desktop\ABC_NewHires.csv"

foreach ($hire in $newHires) {
  $upn = "$($hire.FirstName)$($hire.LastName)@ajaykumarbk75gmail.onmicrosoft.com".ToLower()
  $displayName = "$($hire.FirstName) $($hire.LastName)"
  $body = @{

        accountEnabled    = $true
        displayName       = $displayName
        mailNickname      = "$($hire.FirstName)$($hire.LastName)".ToLower()
        userPrincipalName = $upn
        jobTitle          = $hire.JobTitle
        department        = $hire.Department
        usageLocation     = "IN"
        passwordProfile   = @{ forceChangePasswordNextSignIn = $true; password = "Welcome@ABC2026" }
    } | ConvertTo-Json

    try {
        $created = Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users" -Headers $headers -Body $body
        Write-Host "[CREATED] $displayName -> $upn" -ForegroundColor Green

        # Link manager
        if ($hire.ManagerUPN) {
            $mgrBody = @{ "@odata.id" = "https://graph.microsoft.com/v1.0/users/$($hire.ManagerUPN)" } | ConvertTo-Json
            Invoke-RestMethod -Method Put -Uri "https://graph.microsoft.com/v1.0/users/$upn/manager/`$ref" -Headers $headers -Body $mgrBody
            Write-Host "  Manager set: $($hire.ManagerUPN)" -ForegroundColor Cyan
        }
    }
    catch {
        Write-Warning "[FAILED] $displayName : $($_.Exception.Message)"
    }
}


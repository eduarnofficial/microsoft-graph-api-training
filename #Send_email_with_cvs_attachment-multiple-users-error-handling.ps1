#Send_email_with_cvs_attachment-multiple-users-error-handling

$csvPath = "$env:USERPROFILE\Desktop\ABC_NewHires.csv"
if (-not (Test-Path $csvPath)) {
    Write-Error "CSV file not found at $csvPath"
    return
}

$fileBytes = [System.IO.File]::ReadAllBytes($csvPath)
$base64Content = [System.Convert]::ToBase64String($fileBytes)
$fileName = [System.IO.Path]::GetFileName($csvPath)

$mail = @{
    message = @{
         subject = "Onboarding Report - $(Get-Date -Format 'dd-MM-yyyy')"
         body = @{
                contentType = "HTML"
                content     = "<\p>Hi Team,</p><p>Attached is the latest onboarding report.</p><p>Regards,<br>HR Automation</p>"
         } 
         toRecipients = @(
            @{ emailAddress = @{ address = "toemail1@ajaykumarbk75@outlook.com"} },
            @{ emailAddress = @{ address = "toemail2@ajaykumarbk75@outlook.com"} }
         )
         attachments = @(
            @{
                    "@odata.type"  = "#microsoft.graph.fileAttachment"
                    name           = $fileName
                    contentType    = "text/csv"
                    contentBytes   = $base64Content
            }
         )
    }
    saveToSentItems = $true
} | Convert-To-Json   -Depth 5

try {
    Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users/$upn/sendMail" -Headers $headers -Body $mail -ErrorAction Stop
    Write-Host "[SENT] $filename attached and emailed." -ForegroundColor Green       
} catch {
    Write-Warning "[FAILED] $($_.Exception.Message)"
}
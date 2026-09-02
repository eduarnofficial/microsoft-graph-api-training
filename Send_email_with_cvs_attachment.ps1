
#Send_email_with_cvs_attachment
#FilePath

$upn = "ajaykumarbk75@outlook.com"
$csvPath = "$env:USERPROFILE\Desktop\ABC_NewHires.csv"

#Read file as bytes and base64-encode it
$fileBytes = [System.IO.File]::ReadAllBytes($csvPath)
$base64Content = [System.Convert]::ToBase64String($fileBytes)
$fileName = [System.IO.Path]::GetFileName($csvPath)

$mail = @{
    message = @{
         subject = "New Hires Report - CSV attached"
         body = @{
                contentType = "Text"
                content     = "Please find the attached CSV file with the new hires list."
         } 
         toRecipients = @(
            @{ emailAddress = @{ address = "ajaykumarbk75@outlook.com"} }
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

Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users/$upn/sendMail" -Headers $headers -Body $mail
Write-Host "Email with CSV attachment sent successfully."   -ForegroundColor Green
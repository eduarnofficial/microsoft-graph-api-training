#Send-a-Simple-email

$mail = @{
   message = @{
        subject = "Test from Graph API"
        body = @{
    
            contentType = "Text"
            content = "This is basic test email sent via Microsoft Graph."            
        }
        toRecipients = @(
            @{ emailAddress = @{ address = "trainer1@yourdomain.com"} }
        )     
    }
} | ConvertTo-Json  -Depth 4

Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users/$upn/sendMail" -Headers $headers -Body $mail
Write-Host "Email sent."



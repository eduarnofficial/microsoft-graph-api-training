#Send-email-multiple-Recipients-To+Cc

$mail = @{
   message = @{
        subject = "Test Update"
        body = @{ contentType = "Text"; content = "Weekly update attached." }
        toRecipients = @(
            @{ emailAddress = @{ address = "Toemail1@yourdomain.com"} },
            @{ emailAddress = @{ address = "Toemail2@yourdomain.com"} }
        )
        CcRecipients = @(
            @{ emailAddress = @{ address = "Toemail3@yourdomain.com"} }     
        )
    }
} | ConvertTo-Json  -Depth 4

Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users/$upn/sendMail" -Headers $headers -Body $mail
Write-Host "Email sent to Team (TO:User1, To:User2 & Cc:User3)"


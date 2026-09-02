#Send_email_with-HTML_Content
$mail = @{
    message = @{
        subject = "HTML Test Email"
        body = @{
            contentType = "HTML"
            content = "<h2>Hello!</h2><p>This email has <b>HTML formatting</b>.</p>"       
        }
        toRecipients = @(
            @{ emailAddress = @{ address = "trainer1@yourdomain.com"} }
        )
    }
}  | ConvertTo-Json -Depth 4

Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/users/$upn/sendMail" -Headers $headers -Body $mail
Write-Host "HTML-Email sent."
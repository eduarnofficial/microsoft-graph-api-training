#Set_up_Out-of-Office-Auto-replies
$oofBody = @{
    AutomaticRepliesSetting = @{
        status = "AlwaysEnabled"
        internalReplyMessage = "I am currently Out of Office."
        externalReplyMessage = "Thank you for your email. I am currently out of Office."
        externalAudience = "all"
    }
} | ConvertTo-Json -Depth 5
Invoke-RestMethod -Method Patch -Uri "https://graph.microsoft.com/v1.0/users/$upn/mailboxsettings" -Headers $headers -Body $oofBody

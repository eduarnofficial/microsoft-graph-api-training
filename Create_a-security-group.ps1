#adding-users-into-AI-Eng-Groups- grouoid: ccba070e-a46d-4a1c-aa9f-b3c6b50f749f

$upn = "user4@ajaykumarbk75gmail.onmicrosoft.com"
$groupId = "ccba070e-a46d-4a1c-aa9f-b3c6b50f749f"

$addMemberBody = @{
    "@odata.id" = "https://graph.microsoft.com/v1.0/users/$upn"
} | ConvertTo-Json

try {
    Invoke-RestMethod -Method Post -Uri "https://graph.microsoft.com/v1.0/groups/$groupId/members/`$ref" -Headers $headers -Body $addMemberBody
    Write-Host "[ADDED] $upn -> AI-Eng-Groups ($groupId)" -ForegroundColor Green
} catch {
    Write-Warning "[FAILED] $($_.Exception.Message)"
}
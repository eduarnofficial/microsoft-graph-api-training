# handle-Pagination-with-loop - Top-5 with $Variable

function Get-AllGraphPages {
    param($InitialUri, $Headers)
    $allResults = @()
    $uri = $InitialUri
    do {
        $response = Invoke-RestMethod -Uri $uri -Headers $Headers
        $allResults += $response.value
        $uri = $response.'@odata.nextLink'
    } while ($uri)
    return $allResults
}

$allUsers = Get-AllGraphPages -InitialUri "https://graph.microsoft.com/v1.0/users?`$top=5" -Headers $headers
$allUsers.Count




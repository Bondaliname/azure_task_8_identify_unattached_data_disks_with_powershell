$resourceGroup = "mate-azure-task-5"
$allDisks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDisks = $allDisks | Where-Object {
    -not $_.ManagedBy
}

$jsonOutput = $unattachedDisks | ConvertTo-Json

$jsonOutput | Out-File -FilePath ".\result.json"

Write-Host "result.json"
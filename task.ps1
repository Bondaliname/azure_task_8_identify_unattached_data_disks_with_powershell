$resourceGroup = "mate-azure-task-5"

$allDisks = Get-AzDisk -ResourceGroupName $resourceGroup

$unattachedDataDisks = $allDisks | Where-Object {
    -not $_.ManagedBy -and
    $null -eq $_.OsType
}

$jsonOutput = @($unattachedDataDisks) | ConvertTo-Json

$jsonOutput | Out-File -FilePath ".\result.json"

Write-Host "result.json"

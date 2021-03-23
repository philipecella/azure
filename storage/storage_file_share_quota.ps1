# Change Quota Size of a FileShare
$resourceGroupName = "RGstorage"
$storageAccountName = "lablab123"
$storageKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName).Value[0]
$storageContext = New-AzStorageContext -StorageAccountName $storageAccountName `
                                       -StorageAccountKey $storageKey
$storageContext

$shareName = "pasta123123"
Set-AzStorageShareQuota -ShareName $shareName -Context $storageContext -Quota 3024
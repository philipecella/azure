# Create a FileShare
$resourceGroupName = "RGstorage"
$storageAccountName = "lablab123"
$storageKey = (Get-AzStorageAccountKey -ResourceGroupName $resourceGroupName -Name $storageAccountName).Value[0]
$storageContext = New-AzStorageContext -StorageAccountName $storageAccountName `
                                       -StorageAccountKey $storageKey
$storageContext

$shareName = "past2123123"
New-AzStorageShare -Name $shareName `
                   -Context $storageContext
$DisplayRGNames = (Get-AzResourceGroup).ResourceGroupName
Write-Host -ForegroundColor Blue "List of RGroups"
$DisplayRGNames
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name" 
$DisplaySGNames = Get-AzStorageAccount -ResourceGroupName $resourceGroupName
Write-Host -ForegroundColor yellow "List of StorageAccounts:" $DisplaySGNames.StorageAccountName 
$storageAccName= Read-Host -Prompt "Enter the Storage Account Name"
 
## Function to get all the containers    
Function GetAllStorageContainer    
{    
    Write-Host -ForegroundColor Green "Retrieving storage container.."        
    ## Get the storage account from which container has to be retrieved    
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName        
    ## Get the storage account context    
    $ctx=$storageAcc.Context    
    ## List all the containers    
    $containers=Get-AzStorageContainer  -Context $ctx     
    foreach($container in $containers)    
    {    
        write-host -ForegroundColor Yellow $container.Name    
    }    
}     
    
GetAllStorageContainer
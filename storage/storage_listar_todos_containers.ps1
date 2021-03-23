## Input Parameters    
$resourceGroupName="RGstorage"    
$storageAccName="lablab123"    
  
## Connect to Azure Account    
#Connect-AzAccount     
  
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
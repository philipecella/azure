#List RGroups
$DisplayRGNames = (Get-AzResourceGroup).ResourceGroupName
Write-Host -ForegroundColor Blue "List of RGroups"
$DisplayRGNames
$resourceGroupName= Read-Host -Prompt "Enter the Resource Group name"
#List StorageAccounts
# $DisplaySGNames = (Get-AzStorageAccount -ResourceGroupName $resourceGroupName)
$DisplaySGNames = Get-AzStorageAccount -ResourceGroupName $resourceGroupName
Write-Host -ForegroundColor yellow "List of StorageAccounts:" $DisplaySGNames.StorageAccountName 
$storageAccName= Read-Host -Prompt "Enter the Storage Account Name"  
$storageContainerName= Read-Host -Prompt "Enter the Container name"   
 
Function CreateStorageContainer
{

    Write-Host -ForegroundColor Green "Creating storage container.."  
    ## Get the storage account in which container has to be created  
    $storageAcc=Get-AzStorageAccount -ResourceGroupName $resourceGroupName -Name $storageAccName      
    ## Get the storage account context  
    $ctx=$storageAcc.Context      
 
    ## Check if the storage container exists  
    if(Get-AzStorageContainer -Name $storageContainerName -Context $ctx -ErrorAction SilentlyContinue)  
    {  
        Write-Host -ForegroundColor Magenta $storageContainerName "- container already exists."  
    }  
    else  
    {  
       Write-Host -ForegroundColor Magenta $storageContainerName "- container does not exist."   
       ## Create a new Azure Storage Account  
       New-AzStorageContainer -Name $storageContainerName -Context $ctx -Permission Container  
    }
}    
CreateStorageContainer
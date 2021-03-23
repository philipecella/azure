$DisplayRGNames = (Get-AzResourceGroup).ResourceGroupName
Write-Host -ForegroundColor Blue "List of RGroups:"
$DisplayRGNames
$resourceGroupName = Read-Host -Prompt "Enter the Resource Group name" 
$DisplaySGNames = Get-AzStorageAccount -ResourceGroupName $resourceGroupName
Write-Host -ForegroundColor yellow "List of StorageAccounts:" $DisplaySGNames.StorageAccountName 

 
New-AzResourceGroupDeployment -ResourceGroupName $resourceGroupName -TemplateUri "C:\Users\phili\Desktop\lab\storage\templates\storage_arm_criar_blob_container.json"
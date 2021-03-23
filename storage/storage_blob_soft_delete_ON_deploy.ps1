$resourceGroupName = "RGstorage"
$location = "eastus"

New-AzResourceGroup -Name $resourceGroupName -Location "$location" -Force
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri ".\templates\storage_template_blob_soft_delete_ON.json" `
    -TemplateParameterFile ".\templates\storage_param_blob_soft_delete_ON.json"
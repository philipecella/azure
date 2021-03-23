$resourceGroupName = "RGstorage"
$location = "eastus"

New-AzResourceGroup -Name $resourceGroupName -Location "$location" -Force
New-AzResourceGroupDeployment `
    -ResourceGroupName $resourceGroupName `
    -TemplateUri ".\templates\storage__blog_template.json" `
    -TemplateParameterFile ".\templates\storage_blog_param.json"
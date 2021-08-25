$privateCloudName = "ExamplePrivateCloud"
$resourceGroup = "ExampleResourceGroup"
$location = "Central US"

$addressBlock = "10.0.0.0/22"
$clusterSize = 3
$sku = "AV36"

New-AzVMwarePrivateCloud -Name $privateCloudName -ResourceGroupName $resourceGroup -Location $location -ManagementClusterSize $clusterSize -NetworkBlock $addressBlock -Sku $sku
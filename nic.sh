#NIC create
az network nic create \
    --name $nicname \
    --resource-group $GRUPO \
    --location $loca \
    --vnet-name $vnetname \
    --subnet $subnetname \
    --network-security-group $nsgname 

GRUPO=__grupo__
loca=__loca__
vnetname=__vnetname__
nicname=__nicname__
subnetname=__subnetname__
nsgname=__nsgname__

#NIC create
az network nic create \
    --name $nicname \
    --resource-group $GRUPO \
    --location $loca \
    --vnet-name $vnetname \
    --subnet $subnetname \
    --network-security-group $nsgname 

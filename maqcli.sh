#VM en cli
RESOURCE_GROUP_NAME=__grupo__
LOCATION=__loca__
VM_NAME=__vmname__
VM_IMAGE=__image__
ADMIN_USERNAME=antonio
nicname=__nicname__
subname=__subnetname__
vnetname=__vnetname__
#snap o disco de sistema
MyOsDisk=garrido2disk2snap

#sacar el id del NIC da error
#nic_id=$(az network nic show --name $nicName --resource-group $RESOURCE_GROUP_NAME --query "id" -o tsv)


az vm create \
  --resource-group $GRUPO \
  --name $VM_NAME \
  --location $loca \
  --image $VM_IMAGE \
  --admin-username $ADMIN_USERNAME \
  --generate-ssh-keys \
  --public-ip-sku Standard \
  --size Standard_B1s \
  --nics $nicname \


##Crear VM desde un disco creado de un Snap OS de otra maquina
##az vm create -g $RESOURCE_GROUP_NAME -n $VM_NAME --attach-os-disk $MyOsDisk --os-type linux --generate-ssh-keys --public-ip-sku Standard --size Standard_B1s

#
#  #Funciona
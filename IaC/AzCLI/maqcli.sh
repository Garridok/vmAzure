#VM en cli
RESOURCE_GROUP_NAME=garrido2bash
LOCATION=westeurope
VM_NAME=VMGarrido
VM_IMAGE=Ubuntu2204
ADMIN_USERNAME=antonio
nicName=nicgarridoweu
subname="Subnetbash2"
vnetname=Vnetbash1
#snap o disco de sistema
MyOsDisk=garrido2disk2snap

#sacar el id del NIC da error
#nic_id=$(az network nic show --name $nicName --resource-group $RESOURCE_GROUP_NAME --query "id" -o tsv)


az vm create \
  --resource-group $RESOURCE_GROUP_NAME \
  --name $VM_NAME \
  --location $LOCATION \
  --image $VM_IMAGE \
  --admin-username $ADMIN_USERNAME \
  --generate-ssh-keys \
  --public-ip-sku Standard \
  --size Standard_B1s \
  --nics $nicName \


##Crear VM desde un disco creado de un Snap OS de otra maquina
##az vm create -g $RESOURCE_GROUP_NAME -n $VM_NAME --attach-os-disk $MyOsDisk --os-type linux --generate-ssh-keys --public-ip-sku Standard --size Standard_B1s

#
#  #Funciona
#funciona
#Variables
GRUPO=__grupo__
loca=__loca__
vnetname=__vnetname__
nicname=__nicname__
nsgname=__nsgname__
subnetname=__subnetname__
# Set variables
rule_name="nicprueba"
priority_number=100
destination_port_range="22"
protocol="tcp"
access="Allow"



#crear grupo y location
az group create --name $GRUPO --location $loca

#Vnet create
az network vnet create -g $GRUPO -n $vnetname --address-prefix 10.0.0.0/16 --subnet-name "Subnetbash2" --subnet-prefixes 10.0.0.0/24

# Create a Subnet en el caso que lo necesitaramos
#az network vnet subnet create -g garrido2bash --vnet-name Vnetbash -n Subnetbash --address-prefixes 10.0.0.0/24 --network-security-group Nsgbash --route-table RouteTableBash

#Public IP
az network public-ip create -g $GRUPO -n "pubip"

az network nic create \
    --name $nicname \
    --resource-group $GRUPO \
    --location $loca \
    --vnet-name $vnetname \
    --subnet $subnetname \
    --network-security-group $nsgname 
    
#NSG create
az network nsg create -g $GRUPO -n $nsgname

#NSG habilitar puerto 22
az network nsg rule create \
    --resource-group $GRUPO \
    --nsg-name $nsgname \
    --name SSH \
    --priority 500 \
    --destination-port-ranges "22" \
    --protocol "tcp" \
    --access "Allow"

#NIC create



#ssh cambiar ubicacion del archivo
#az ssh config --resource-group $RESOURCE_GROUP_NAME --name $VM_NAME --file ./sshconfig
#ssh -F ./sshconfig $RESOURCE_GROUP_NAME-$VM_NAME

#Funciona con puerto 22 levantado por NSG, NIC con sus valores
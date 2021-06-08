private_subnet1_range  = "10.0.1.0/24"
private_subnet2_range  = "10.0.2.0/24"
private_subnet3_range  = "10.0.3.0/24"


public_subnet1_range  = "10.0.101.0/24"
public_subnet2_range  = "10.0.102.0/24"
public_subnet3_range  = "10.0.103.0/24"

vm1_computername = "vm1"
vm2_computername = "vm2"
vm3_computername = "vm3"


#OS Information
publisher = "OpenLogic"
offer = "CentOS"
sku = "7.5"
os_version = "latest"
admin_username = "centos"
vm_size = "Standard_DS1_v2"




resource_group_name    = "dev" 
address_space          = "10.0.0.0/16"
vnet_name              = "vnet1"
location               = "westus2"
environment            = "dev"
tags = {
	Name = "VPC_Project"
	Environment = "Dev"
	Team = "DevOps"
	Department = "IT"
	Bill = "CFO"
	Quarter = "3"
}

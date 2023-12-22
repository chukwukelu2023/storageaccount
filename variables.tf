variable "rg_name" {
  type        = string
  description = "The name of resource group"
}

variable "location" {
  type        = string
  description = "The region where the resources will be located"
}

variable "storage_name" {
  type        = string
  description = "Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}

variable "storage_tier" {
  type        = string
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid. Changing this forces a new resource to be created."
}

variable "storage_replication" {
  type        = string
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS."
}

variable "resource_tags" {
  type        = map(string)
  description = "Tags for identifying resources"
}

variable "container_name" {
  type        = string
  description = "The name of the Container which should be created within the Storage Account. Changing this forces a new resource to be created."
}

variable "container_access" {
  type        = string
  description = "The Access Level configured for this Container. Possible values are blob, container or private. Defaults to private."
}

variable "vnet_name" {
  type        = string
  description = "The name of the virtual network. Changing this forces a new resource to be created."
}

variable "vnet_cidr" {
  type        = list(string)
  description = "he address space that is used the virtual network. You can supply more than one address space."
}

variable "public_subnet_name" {
  type        = string
  description = "The name of the subnet with public ip. Changing this forces a new resource to be created."
}

variable "subnet_iprange" {
  type        = list(string)
  description = "The address prefixes to use for the subnet."
}
variable "subnets" {
  type        = map(list(string))
  description = "The details of the subnet(s) to be creates"
}

variable "pub_ip_name" {
  type        = string
  description = "Specifies the name of the Public IP. Changing this forces a new Public IP to be created."
}

variable "ip_allocation" {
  type        = string
  description = "Defines the allocation method for this IP address. Possible values are Static or Dynamic."
}

variable "network_interface" {
  type        = map(string)
  description = "The detaisl of network interface(s) that will be created"
}

variable "public_nic" {
  type        = string
  description = "The name of network interface with public ip"
}

variable "vm_password" {
  type        = string
  description = "The Password which should be used for the local-administrator on this Virtual Machine. Changing this forces a new resource to be created."
}

variable "vm_username" {
  type        = string
  description = "The username of the local administrator used for the Virtual Machine. Changing this forces a new resource to be created."
}

variable "vm_name" {
  type        = string
  description = "The name of the Windows Virtual Machine. Changing this forces a new resource to be created."
}

variable "vm_size" {
  type        = string
  description = "The SKU which should be used for this Virtual Machine, such as Standard_F2."
}

variable "linux_nic" {
  type        = string
  description = "The nic interface for linux vm"
}

variable "windows_nic" {
  type        = string
  description = "The nic interface for linux vm"
}

variable "os_disk_cache" {
  type        = string
  description = "The Type of Caching which should be used for the Internal OS Disk. Possible values are None, ReadOnly and ReadWrite."
}

variable "os_disk_storage" {
  type        = string
  description = "The Type of Storage Account which should back this the Internal OS Disk. Possible values are Standard_LRS, StandardSSD_LRS, Premium_LRS, StandardSSD_ZRS and Premium_ZRS. Changing this forces a new resource to be created."
}

variable "linux_image_publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "linux_image_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "linux_image_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "linux_image_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "service_endpoint" {
  type        = list(string)
  description = "The list of Service endpoints to associate with the subnet."
}


variable "windows_image_publisher" {
  type        = string
  description = "Specifies the publisher of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "windows_image_offer" {
  type        = string
  description = "Specifies the offer of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "windows_image_sku" {
  type        = string
  description = "Specifies the SKU of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "windows_image_version" {
  type        = string
  description = "Specifies the version of the image used to create the virtual machines. Changing this forces a new resource to be created."
}

variable "storage_ip_rules" {
  type        = list(string)
  description = " List of public IP or IP ranges in CIDR Format. Only IPv4 addresses are allowed. /31 CIDRs, /32 CIDRs, and Private IP address ranges (as defined in RFC 1918), are not allowed."
}

variable "storage_default_action" {
  type        = string
  description = "Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow."
}

variable "sg_name" {
  type = string
  description = "Specifies the name of the network security group. Changing this forces a new resource to be created."
}

variable "sg_rule_name" {
  type = string
  description = "The name of the security rule."
}

variable "sg_rule_protocol" {
  type = string
  description = "Network protocol this rule applies to. Possible values include Tcp, Udp, Icmp, Esp, Ah or *"
}

variable "sg_source_port" {
  type = string
  description = "Source Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if source_port_ranges is not specified."
}

variable "sg_destination_port" {
  type = string
  description = "Destination Port or Range. Integer or range between 0 and 65535 or * to match any. This is required if destination_port_ranges is not specified."
}

variable "source_addres" {
  type = string
  description = "CIDR or source IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. This is required if source_address_prefixes is not specified."
}

variable "destination_address" {
  type = string
  description = "CIDR or destination IP range or * to match any IP. Tags such as VirtualNetwork, AzureLoadBalancer and Internet can also be used. This is required if destination_address_prefixes is not specified."
}

variable "sg_access_rule" {
  type = string
  description = "Specifies whether network traffic is allowed or denied. Possible values are Allow and Deny."
}

variable "sg_rule_priority" {
  type = number
  description = " Specifies the priority of the rule. The value can be between 100 and 4096. The priority number must be unique for each rule in the collection. The lower the priority number, the higher the priority of the rule."
}

variable "sg_rule_direction" {
  type = string
  description = "The direction specifies if rule will be evaluated on incoming or outgoing traffic. Possible values are Inbound and Outbound."
}
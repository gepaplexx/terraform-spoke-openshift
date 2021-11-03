###############################
# Spoke network configuration #
###############################

variable "spoke_mac_prefix" {
  type = string
  description = "MAC address prefix used for each vm in the spoke network"
}

variable "spoke_network_name" {
  type = string
  description = "Name of the network. preferably use the FQDN of the ocp cluster."
}

########################
# vmware configuration #
########################

variable "vmware_host" {
  type = string
  description = "The vsphere host name or ip used for authentication."
}
variable "vmware_user" {
  type = string
  description = "The vsphere user used for authentication."
}

variable "vmware_password" {
  type = string
  description = "The vsphere passwordused for authentication."
}

variable "vmware_datacenter" {
  type = string
  description = "The vsphere datacenter name."
}

variable "vmware_computecluster" {
  type = string
  description = "The vsphere computecluster name."
}

variable "vmware_datastore" {
  type = string
  description = "The vsphere datastore name."
}

#############################
# VM resource configuration #
#############################

variable "ocp_infra_cpu" {
  type = number
  description = "Specify the cpu for service vms."
}

variable "ocp_infra_memory_mb" {
  type = number
  description = "Specify the ram in MB for servicce vms."
}

variable "ocp_master_cpu" {
  type = number
  description = "Specify the cpu for service vms."
}

variable "ocp_master_memory_mb" {
  type = number
  description = "Specify the ram in MB for servicce vms."
}

variable "ocp_worker_cpu" {
  type = number
  description = "Specify the cpu for service vms."
}

variable "ocp_worker_memory_mb" {
  type = number
  description = "Specify the ram in MB for servicce vms."
}

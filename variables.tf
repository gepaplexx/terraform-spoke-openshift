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
  description = "Specify the cpu for openshift infra vms."
}

variable "ocp_infra_memory_mb" {
  type = number
  description = "Specify the ram in MB for openshift infra vms."
}

variable "ocp_infra_disk_gb" {
  type = number
  description = "Specify the storage for rookfs + ceph in GB."
}

variable "ocp_master_count" {
  type = number
  validation {
      condition     = var.ocp_master_count == 3 || var.ocp_master_count == 5 || var.ocp_master_count == 7
      error_message = "Valid values for var: ocp_master_count are (3, 5, 7)."
  }
  description = "Specify the number of master vms (valid values are 3,5,7)."
}

variable "ocp_master_cpu" {
  type = number
  description = "Specify the cpu for openshift master vms."
}

variable "ocp_master_memory_mb" {
  type = number
  description = "Specify the ram in MB for openshift master vms."
}

variable "ocp_worker_count" {
  type = number
  description = "Specify the number of worker vms."
}

variable "ocp_worker_cpu" {
  type = number
  description = "Specify the cpu for openshift worker vms."
}

variable "ocp_worker_memory_mb" {
  type = number
  description = "Specify the ram in MB for openshift worker vms."
}

variable "ocp_worker_disk_gb" {
  type = number
  description = "Specify the disk size for each worker in GB."
}

###############################
# Spoke network configuration #
###############################

variable "spoke_mac_prefix" {
  type        = string
  description = "MAC address prefix used for each vm in the spoke network"
}

variable "spoke_network_name" {
  type        = string
  description = "Name of the network. preferably use the FQDN of the ocp cluster."
}

########################
# vmware configuration #
########################

variable "vmware_host" {
  type        = string
  description = "The vsphere host name or ip used for authentication."
}
variable "vmware_user" {
  type        = string
  description = "The vsphere user used for authentication."
}

variable "vmware_password" {
  type        = string
  description = "The vsphere passwordused for authentication."
}

variable "vmware_datacenter" {
  type        = string
  description = "The vsphere datacenter name."
}

variable "vmware_computecluster" {
  type        = string
  description = "The vsphere computecluster name."
}

variable "vmware_datastore" {
  type        = string
  description = "The vsphere datastore name."
}

#############################
# VM resource configuration #
#############################

variable "ocp_infra_count" {
  type = number
  validation {
    condition     = can(regex("0|1|2|3|5|7", var.ocp_infra_count))
    error_message = "Valid values for var: ocp_master_count are (0-3,5,7)."
  }
  description = "Specify the number of infrastructure vms (valid values are 0-3,5,7)."
}

variable "ocp_infra_cpu" {
  type        = number
  description = "Specify the cpu for openshift infra vms."
}

variable "ocp_infra_memory_mb" {
  type        = number
  description = "Specify the ram in MB for openshift infra vms."
}

variable "ocp_infra_disk_gb" {
  type        = number
  description = "Specify the storage for rookfs + ceph in GB."
}

variable "ocp_master_count" {
  type = number
  validation {
    condition     = can(regex("1|3|5|7", var.ocp_master_count))
    error_message = "Valid values for var: ocp_master_count are (1,3,5,7)."
  }
  description = "Specify the number of master vms (valid values are 1,3,5,7)."
}

variable "ocp_master_cpu" {
  type        = number
  description = "Specify the cpu for openshift master vms."
}

variable "ocp_master_memory_mb" {
  type        = number
  description = "Specify the ram in MB for openshift master vms."
}

variable "ocp_worker_count" {
  type        = number
  description = "Specify the number of worker vms."
}

variable "ocp_worker_cpu" {
  type        = number
  description = "Specify the cpu for openshift worker vms."
}

variable "ocp_worker_memory_mb" {
  type        = number
  description = "Specify the ram in MB for openshift worker vms."
}

variable "ocp_worker_disk_gb" {
  type        = number
  description = "Specify the disk size for each worker in GB."
}

variable "ocp_worker_storage_enabled" {
  type        = number
  description = "Whether worker should be provisioned with disk space for dynamic storage provisioning"
  default     = 0
  validation {
    condition     = can(regex("0|1", var.ocp_worker_storage_enabled))
    error_message = "Valid values for var: ocp_worker_storage_enabled are (0,1)."
  }
}

variable "ocp_worker_storage_size_gb" {
  type        = number
  description = "Size of disk to be used for dynamic storage provisioning on worker nodes"
  default     = 128
}
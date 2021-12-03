# Terraform: spoke-openshift

![MIT](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)
![GitHub last commit](https://img.shields.io/github/last-commit/gepaplexx/ansible-role-terraform?style=flat-square)
![Maintenance](https://img.shields.io/maintenance/yes/2022?style=flat-square)

Create empty VMs for OpenShift UPI installation.

Variable Name | Type | Description
------------ | ------------- | -------------
spoke_mac_prefix | string | MAC address prefix used for each vm in the spoke network
spoke_network_name | string | Name of the network. preferably use the FQDN of the ocp cluster.
vmware_host | string | The vsphere host name or ip used for authentication.
vmware_user | string | The vsphere user used for authentication.
vmware_password | string | The vsphere passwordused for authentication.
vmware_datacenter | string | The vsphere datacenter name.
vmware_computecluster | string | The vsphere computecluster name.
vmware_datastore | string | The vsphere datastore name.
ocp_infra_cpu | number | Specify the cpu for openshift infra vms.
ocp_infra_memory_mb | number | Specify the ram in MB for openshift infra vms.
ocp_infra_disk_gb | number | Specify the storage for rookfs + ceph in GB.
ocp_master_cpu | number | Specify the cpu for openshift master vms.
ocp_master_memory_mb | number | Specify the ram in MB for openshift master vms.
ocp_worker_count | number | Specify the number of worker vms.
ocp_worker_cpu | number | Specify the cpu for openshift worker vms.
ocp_worker_memory_mb | number | Specify the ram in MB for openshift worker vms.
ocp_worker_disk_gb | number | Specify the disk size for each worker in GB.

## License

MIT

## Contributions

- [@ckaserer](https://github.com/ckaserer)
- [@fhochleitner](https://github.com/fhochleitner)

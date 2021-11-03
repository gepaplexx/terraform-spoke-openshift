data "vsphere_datacenter" "dc" {
  name = "${var.vmware_datacenter}"
}

data vsphere_compute_cluster "cc" {
  name          = "${var.vmware_computecluster}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data vsphere_datastore "ds" {
  name          = "${var.vmware_datastore}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

data vsphere_network "network" {
  name          = "${var.spoke_network_name}"
  datacenter_id = "${data.vsphere_datacenter.dc.id}"
}

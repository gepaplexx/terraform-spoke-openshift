resource vsphere_virtual_machine "bootstrap" {
  name             = "bootstrap.${var.spoke_network_name}"
  resource_pool_id = "${data.vsphere_compute_cluster.cc.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.ds.id}"
  folder           = "GP/${var.spoke_network_name}"

  num_cpus  = "${var.ocp_master_cpu}"
  memory    = "${var.ocp_master_memory_mb}"
  guest_id  = "otherLinux64Guest"
  firmware  = "efi"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    use_static_mac = "true"
    mac_address = "${var.spoke_mac_prefix}:09"
  }
  wait_for_guest_net_timeout = 0
  
  disk {
    label            = "disk0"
    size             = 128
  }

}
resource vsphere_virtual_machine "infra" {
  count            = var.ocp_infra_count
  name             = "infra${count.index}.${var.spoke_network_name}"
  resource_pool_id = "${data.vsphere_compute_cluster.cc.resource_pool_id}"
  datastore_id     = "${data.vsphere_datastore.ds.id}"
  folder           = "GP/${var.spoke_network_name}"

  num_cpus  = "${var.ocp_infra_cpu}"
  memory    = "${var.ocp_infra_memory_mb}"
  guest_id  = "otherLinux64Guest"
  firmware  = "efi"

  network_interface {
    network_id   = "${data.vsphere_network.network.id}"
    use_static_mac = "true"
    mac_address = "${var.spoke_mac_prefix}:${format("%02X", (count.index + 17))}"
  }
  wait_for_guest_net_timeout = 0
  
  disk {
    label            = "disk0"
    size             = 128
    unit_number      = 0
  }
  
  disk {
    label            = "disk1"
    size             = "${var.ocp_infra_disk_gb}"
    unit_number      = 1
  }

}
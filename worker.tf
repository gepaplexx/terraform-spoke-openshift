resource vsphere_virtual_machine "worker" {
  count            = var.ocp_worker_count
  name             = "worker${count.index + 20}.${var.spoke_network_name}"
  resource_pool_id = data.vsphere_compute_cluster.cc.resource_pool_id
  datastore_id     = data.vsphere_datastore.ds.id
  folder           = "GP/${var.spoke_network_name}"

  num_cpus  = var.ocp_worker_cpu
  memory    = var.ocp_worker_memory_mb
  guest_id  = "otherLinux64Guest"
  firmware  = "efi"

  network_interface {
    network_id   = data.vsphere_network.network.id
    use_static_mac = "true"
    mac_address = "${var.spoke_mac_prefix}:${format("%02X", (count.index + 20))}"
  }
  wait_for_guest_net_timeout = 0
  
  disk {
    label            = "disk0"
    size             = var.ocp_worker_disk_gb
    unit_number      = 0
  }

  dynamic "disk" {
    for_each        = var.ocp_worker_storage_enabled
    content {
      label           = "disk1"
      size            = var.ocp_worker_storage_size_gb
      unit_number     = 1
    }
  }

}
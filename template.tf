resource "proxmox_virtual_environment_vm" "pfsense_template" {
  name = "template-example"
  node_name = "pve"

  started = true

  machine = "q35"
  bios = "ovmf"
  description = "Managed By Terraform"

  cdrom{


  }

  cpu {
    cores = 2
  }

  memory { 
    dedicated = 1024
  }

  efi_disk {
    datastore_id = "local-lvm"
    type = "4m"
  }
#   disk {
#     datastore_id = "local-lvm"
#     file_id = "local:iso/netgate-installer-v1.1-RELEASE-amd64.iso"
#     interface = "virtio0"
#     iothread = true
#     discard = "on"
#     size = 20
#   }
  disk{
    interface="virtio1"
    iothread = true
    datastore_id = "local-lvm"
    discard = "on"
    size = 8
  }
  initialization {
    ip_config {
      ipv4 {
        address = "dhcp"
      }
    }

  }
  network_device {
    bridge = "vmbr0"
  }


}
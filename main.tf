terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~>0.86.0"
    }
    talos = {
      source = "siderolabs/talos"
      version = "~> 0.7.1"
    }
  }
}


module "talos" {
    source  = "bbtechsys/talos/proxmox"
    version = "0.1.5"
    talos_cluster_name = "test-cluster"
    talos_version = "1.11.0"
    control_nodes = {
        "test-control-0" = "pve"
    }
    worker_nodes = {
        "test-worker-0" = "pve"
    }
}

output "talos_config" {
    description = "Talos configuration file"
    value       = module.talos.talos_config
    sensitive = true
}

output "kubeconfig" {
    description = "Kubeconfig file"
    value       = module.talos.kubeconfig
    sensitive   = true
}


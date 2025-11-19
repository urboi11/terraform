provider "proxmox" {
  endpoint = var.pm_api_url
  username = var.pm_username
  password = var.pm_password
  insecure = true

  ssh{
    agent = true
  }
}
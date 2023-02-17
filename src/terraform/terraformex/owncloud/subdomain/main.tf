```HCL
terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}

provider "grid" {
}

# this data source is used to break circular dependency in cases similar to the following:
# vm: needs to know the domain in its init script
# gateway_name: needs the ip of the vm to use as backend.
# - the fqdn can be computed from grid_gateway_domain for the vm
# - the backend can reference the vm ip directly  


locals {
  solution_type = "Owncloud"
  name          = "MyOwnCloud"
  node          = 34
}

data "grid_gateway_domain" "domain" {
  node = 45
  name = local.name
}

resource "grid_network" "net1" {
  solution_type = local.solution_type
  name          = local.name
  nodes         = [local.node]
  ip_range      = "10.1.0.0/16"
  description   = "newer network"
}
resource "grid_deployment" "d1" {
  node          = local.node
  solution_type = local.solution_type
  name          = local.name
  network_name  = grid_network.net1.name
  vms {
    name  = "vm1"
    flist = "https://hub.grid.tf/tf-official-apps/owncloud-10.9.1.flist"
    cpu   = 2
    # publicip = true
    entrypoint = "/sbin/zinit init"
    memory     = 4096
    env_vars = {
      SSH_KEY = "ssh-key"
      OWNCLOUD_DOMAIN = "domain"
      OWNCLOUD_ADMIN_USERNAME = "adminUsername"
      OWNCLOUD_ADMIN_PASSWORD = "adminPassword"
      OWNCLOUD_MAIL_SMTP_SECURE = "smtp_secure"
      OWNCLOUD_MAIL_DOMAIN = "emailDomain"
      OWNCLOUD_MAIL_FROM_ADDRESS = "emailName"
      OWNCLOUD_MAIL_SMTP_HOST = "smtpHost"
      OWNCLOUD_MAIL_SMTP_PORT = "${smtpPort}`"
      OWNCLOUD_MAIL_SMTP_NAME = "smtpHostUser"
      OWNCLOUD_MAIL_SMTP_PASSWORD = "smtpHostPassword"
    }
    planetary = true
  }
}
resource "grid_name_proxy" "p1" {
  node            = 45
  solution_type   = local.solution_type
  name            = local.name
  backends        = [format("http://[%s]:9000", grid_deployment.d1.vms[0].ygg_ip)]
  tls_passthrough = false
}
output "fqdn" {
  value = data.grid_gateway_domain.domain.fqdn
}
output "node1_zmachine1_ip" {
  value = grid_deployment.d1.vms[0].ip
}

# output "computed_public_ip" {
#     value = split("/",grid_deployment.d1.vms[0].computedip)[0]
# }

output "ygg_ip" {
  value = grid_deployment.d1.vms[0].ygg_ip
}
```

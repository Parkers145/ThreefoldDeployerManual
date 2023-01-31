# Example Multi Node Terraform Main.tf

up to date as of 01/03/2023

# The Main.TF 


This is a configuration file written in Terraform, which is a tool for building, changing, and versioning infrastructure safely and efficiently. The file describes resources that will be created in the Grid platform by ThreeFold Tech.

The file is made up of 
- **Variable Blocks**

    The file first defines several variables that the user can specify when running the Terraform configuration. These include 
    - the "MNEMONICS" (a mnemonic phrase used to generate a seed for a node), 
    - the "NETWORK" to connect the node to (with a default value of "main"), 
    - and "SSH_KEY" (the type of which is specified as a string).

- **Terraform Blocks**

    The file then specifies that it will use the "grid" provider (which is provided by ThreeFold Tech) and specifies the
    - "MNEMONICS" and 
    - "NETWORK" 
    variables as arguments for the provider.

- **Resource Blocks**

    The file then creates three resources: 
    - a "grid_network" resource named "net1" and 
    - two "grid_deployment" resources named "d1" and "d2". The "grid_network" resource creates an internal network with the specified IP range and adds WireGuard access. The "grid_deployment" resources create virtual machines (VMs) on nodes 311 and 312, respectively, with the specified properties (e.g. CPU, memory, etc.). The VMs are also connected to the "internal" network created by the "grid_network" resource and have disks attached to them.

- **Output Block**

    Finally, the file defines several output variables that will be displayed to the user after running the configuration, such as 
    - the IP address of the first VM, 
    - the public IP address of the VM, and 
    - the VM's WireGuard IP address.

<details>
    <summary><b>The Multi-Node Example Main.tf</b></Summary>

```
variable "MNEMONICS" {
  type        = string
  description = "The mnemonic phrase used to generate the seed for the node."
}

variable "NETWORK" {
  type        = string
  default     = "main"
  description = "The network to connect the node to."
}


variable "SSH_KEY" {
  type = string
}


terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}

provider "grid" {
    mnemonics = "${var.MNEMONICS}"
    network = "${var.NETWORK}"  
}

resource "grid_network" "net1" {
    nodes = [311, 312]
    ip_range = "10.32.0.0/16"
    name = "internal"
    description = "Internal subnet"
    add_wg_access = true
}
resource "grid_deployment" "d1" {
  node = 311
  network_name = grid_network.net1.name
  disks {
    name = "data"
    size = 25
  }
    vms {
    name = "vm1"
    description ="Test vm 1"
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist"
    cpu = 4
    publicip = true
    publicip6 = true
    memory = 8192
    mounts {
        disk_name = "data"
        mount_point = "/data"
    }
    planetary = true
    env_vars = {
      SSH_KEY = "${var.SSH_KEY}"
    }
  }
}
resource "grid_deployment" "d2" {
  node = 312
  network_name = grid_network.net1.name
  disks {
    name = "data"
    size = 25
  }
    vms {
    name = "vm2"
    description ="Test vm 2"
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist"
    cpu = 4
    publicip = true
    publicip6 = true
    memory = 8192
    mounts {
        disk_name = "data"
        mount_point = "/data"
    }
    planetary = true
    env_vars = {
      SSH_KEY = "${var.SSH_KEY}"
    }
  }
}
output "wg_config" {
value = grid_network.net1.access_wg_config
}
output "node1_vm1_ip" {
value = grid_deployment.d1.vms[0].ip
}
output "public_ip" {
value = grid_deployment.d1.vms[0].computedip
}
output "public_ip6" {
value = grid_deployment.d1.vms[0].computedip6
}
output "ygg_ip" {
value = grid_deployment.d1.vms[0].ygg_ip
}
```
</details>

<details>
    <summary><b> How To Deploy</b></Summary>

To deploy the main.tf IF the file is located in /deployments/testdeployments, you would need to navigate to the /deployments/testdeployments directory and run the following command:

```
terraform init
```

This command will initialize the current working directory as a Terraform configuration directory and install the required provider(s) specified in the configuration.

Next, you would need to create a file called env.tfvars in the /deployments directory, which should contain the values for the variables defined in main.tf. For example:

```
MNEMONICS = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon"
NETWORK = "testnet"
SSH_KEY = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGxLxD7Vb+Q2uG5jJnCzGzo5P5M5ty5LXc5vF8WxZ6IgZ+fta0rmecv+8tGJ10dOm1tF9A0vG8W+jPfZ0+GAZMLL+oN8wz+1hE2GJbT+T3r1WbL/ZpDdZoLLIo+zRfWGfrHc2QhF9T3SSrTbTnZpTdDxTn7vF8BwWFrzjdYiei+9GvM8QtdxZjJcZiEf1LhG8Qzwrc5a5n0if5cXpjm5x"
```

Then, you can run the following command to deploy the configuration:

```
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/env.tfvars"
```

This command will apply the changes specified in the configuration and create the resources defined in main.tf. The -var-file flag specifies the path to the env.tfvars file, which contains the values for the variables defined in the configuration.

After the resources have been created, you can view the output variables by running:

```
terraform output
```
</details>

<details>
    <summary><b>How Can I make My Own</b></Summary> 

Here is a detailed explanation of each block and sub-block in the provided main.tf file:

```
variable "MNEMONICS" {
  type        = string
  description = "The mnemonic phrase used to generate the seed for the node."
}
```

This block defines a variable called "MNEMONICS" of type "string". When the configuration is run, the user will be prompted to provide a value for this variable. The "description" field provides a brief explanation of the purpose of this variable.

An example value for this variable could be:

```
MNEMONICS = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon"
Copy code
variable "NETWORK" {
  type        = string
  default     = "main"
  description = "The network to connect the node to."
}
```

This block defines a variable called "NETWORK" of type "string". The "default" field specifies that the default value for this variable is "main", so if the user does not specify a value for this variable when running the configuration, the value "main" will be used. The "description" field provides a brief explanation of the purpose of this variable.

An example value for this variable could be:

```
NETWORK = "testnet"
```


This block defines a variable called "SSH_KEY" of type "string". No default value is specified, so the user will be required to provide a value for this variable when running the configuration.

An example value for this variable could be:

```
SSH_KEY = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGxLxD7Vb+Q2uG5jJnCzGzo5P5M5ty5LXc5vF8WxZ6IgZ+fta0rmecv+8tGJ10d
```

```
terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}
```

This block specifies that the configuration will use the "grid" provider, which is provided by ThreeFold Tech. The "source" field specifies the location of the provider, which in this case is "threefoldtech/grid".

```
provider "grid" {
    mnemonics = "${var.MNEMONICS}"
    network = "${var.NETWORK}"  
}
```

This block specifies that the provider is the "grid" provider and that it should use the values of the "MNEMONICS" and "NETWORK" variables as arguments.

```
resource "grid_network" "net1" {
    nodes = [311, 312]
    ip_range = "10.32.0.0/16"
    name = "internal"
    description = "Internal subnet"
    add_wg_access = true
}
```

This block creates a "grid_network" resource named "net1". The "grid_network" resource creates an internal network on the specified nodes (in this case, nodes 311 and 312) with the specified IP range, name, and description. The "add_wg_access" field specifies that WireGuard access should be added to the network.

```
resource "grid_deployment" "d1" {
  node = 311
  network_name = grid_network.net1.name
  disks {
    name = "data"
    size = 25
  }
  vms {
    name = "vm1"
    description ="Test vm 1"
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist"
    cpu = 4
    publicip = true
    publicip6 = true
    memory = 8192
    mounts {
        disk_name = "data"
        mount_point = "/data"
    }
    planetary = true
    env_vars = {
      SSH_KEY = "${var.SSH_KEY}"
    }
  }
}
```

This block creates a "grid_deployment" resource named "d1". The "grid_deployment" resource creates a VM on node 311, which is connected to the "internal" network created by the "grid_network" resource. The VM has the specified name, description, and properties (e.g. CPU, memory, etc.). The "flist" field specifies the URL of the file list to use for the VM. The "publicip" and "publicip6" fields specify that the VM should have a public IP address and a public IPv6 address, respectively. The "mounts" block specifies that the VM should have a disk attached to it at the specified mount point. The "env_vars" block specifies environment variables that should be set for the VM, in this case setting the value of the "SSH_KEY" variable as the value of the "SSH_KEY" environment variable.

```
resource "grid_deployment" "d2" {
  node = 312
  network_name = grid_network.net1.name
  disks {
    name = "data"
    size = 25
  }
  vms {
    name = "vm2"
    description ="Test vm 2"
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist"
    cpu = 4
    publicip = true
    publicip6 = true
    memory = 8192
    mounts {
        disk_name = "data"
        mount_point = "/data"
    }
    planetary = true
    env_vars = {
      SSH_KEY = "${var.SSH_KEY}"
    }
  }
}
```
This block is similar to the previous "grid_deployment" block (for "d1"), except that it creates a VM on node 312 instead of node 311.

```
output "wg_config" {
  value = grid_network.net1.access_wg_config
}
```

This block defines an output variable called "wg_config" that will display the WireGuard configuration for the "internal" network created by the "grid_network" resource.

```
output "node1_vm1_ip" {
  value = grid_deployment.d1.vms[0].ip
}
```

This block defines an output variable called "node1_vm1_ip" that will display the IP address of the first VM created by the "grid_deployment" resource "d1".

```
output "public_ip" {
  value = grid_deployment.d1.vms[0].computedip
}
```

This block defines an output variable called "public_ip" that will display the public IP address of the first VM created by the "grid_deployment" resource "d1".

```
output "public_ip6" {
  value = grid_deployment.d1.vms[0].computedip6
}
```

This block defines an output variable called "public_ip6" that will display the public IPv6 address of the first VM created by the "grid_deployment" resource "d1".

```
output "ygg_ip" {
  value = grid_deployment.d1.vms[0].ygg_ip
}
```

This block defines an output variable called "ygg_ip" that will display the Yggdrasil IP address of the first VM created by the "grid_deployment" resource "d1".
</details>

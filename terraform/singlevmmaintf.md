# What is a Main.tf?




&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A main.tf file is a configuration file that defines the infrastructure resources that should be created and managed by Terraform. It is typically the main entry point for a Terraform configuration, and it is used to specify the provider, resources, and outputs for a configuration.

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The main.tf file is written in the HashiCorp Configuration Language (HCL), which is a declarative language that is used to define the desired state of an infrastructure. In the main.tf file, you can specify the properties of the resources that should be created, as well as any dependencies or relationships between those resources.

For example, you might use a main.tf file to define the following resources:

- Virtual machines
- Zero-Databases
- Containers
- Cloud storage buckets

# What makes up the file 

<details>
	<summary><b>Terraform Block</b></summary> 
```
terraform {
 required_providers {
  grid = {
   source = "threefoldtech/grid"
   }
  }
 } 
```
 
- The terraform block is the top-level block in the configuration file. It is used to configure the behavior of Terraform itself.

- The terraform block includes a single sub-block called required_providers.

	- **required_providers block**
		- The required_providers block is used to specify the Terraform providers that are required by the configuration. A provider is a plugin that implements the logic for a specific resource type, such as a cloud platform or a configuration management tool.

		- The required_providers block includes a single sub-block called grid, which specifies the threefoldtech/grid provider. This provider is required to manage resources in the Threefold Grid.
</details>
	
<details>
	<summary><b>Provider Block</b></summary> 

```
provider "grid" {
}
```

- The provider block is used to configure a Terraform provider. It specifies the provider's name and any provider-specific configuration options.

- There is a single provider block that configures the grid provider. The provider block does not include any arguments, which means that it is using the default configuration for the grid provider.
</details>

<details>
	<summary><b>Grid Network Block </b></summary>

```
resource "grid_network" "net1" {
	nodes = [3000]
	ip_range = "10.20.0.0/16"
	name = "mynetwork"
	description = "My internal Grid network"
	add_wg_access = true
}
```
This block is defining a new resource of type grid_network, with the identifier net1. The grid_network block is used to create a network in the Threefold Grid. A network is a virtual network that connects nodes in the Grid and allows them to communicate with each other. the grid_network resource has the identifier net1, These identifiers are used to refer to the resources elsewhere in the configuration.

For example, the network_name argument of the grid_deployment resource refers to the name attribute of the grid_network resource with the identifier net1

The block contains several arguments that are specific to the grid_network resource type:

- nodes: The nodes argument is a list of node IDs that should be included in the network. When a node is added to a network, it is assigned an IP address from the network's IP range, and it becomes available to host applications or workloads.
- ip_range: the ip_range argument specifies the IP range of the network. An IP range is a range of IP addresses that are available for use on a network. It is specified using the CIDR notation, which consists of an IP address followed by a slash and the number of bits of the address that are used for the network prefix.
- name: The name of a network is a human-readable identifier that is used to refer to the network within the Threefold Grid. It is not required to be unique, but it is typically used to distinguish between different networks in the Grid.
- description: A description of the network.
- add_wg_access: The add_wg_access argument in the grid_network resource controls whether WireGuard access should be enabled for the network. When add_wg_access is set to true, the grid provider will create a WireGuard access point for the network. This allows users to connect to the network using the WireGuard VPN protocol.
</details>

<details>
	<summary><b>Grid Deployment Block</b></summary>
```
resource "grid_deployment" "d1" {
  node = 3000
  network_name = grid_network.net1.name
  ip_range = lookup(grid_network.net1.nodes_ip_range, 3000, "")
  disks {
    name = "root"
    size = 50
  }
    vms {
    name = "tftest"
    description ="Terraform deployment test"
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist"
    cpu = 4
    publicip = true
    publicip6 = true
    memory = 8192
    mounts {
        disk_name = "root"
        mount_point = "/data"
    }
    planetary = true
    env_vars = {
      SSH_KEY ="ADD YOUR SSH KEY HERE"
    }
  }
}
```
The grid_deployment block is used to create a deployment in the Threefold Grid. A deployment is a logical grouping of nodes, disks, and virtual machines that can be used to host applications or workloads.

The grid_deployment block includes the following arguments:

- node: The ID of the node where the deployment should be created.
- network_name: The name of the network to which the deployment should be connected.
- ip_range: The IP range of the deployment. The deployment will assign IP addresses from this range to the nodes, disks, and virtual machines in the deployment.

The grid_deployment block also includes the following sub-blocks:

- disks: The disks block is used to specify one or more disks that should be created and attached to the deployment. A disk is a block storage device that can be used to store data. Each disk block in the disks block specifies the properties of a single disk. The disk block includes the following arguments:
		- name: The name of the disk
		- size: The size of the disk in GB.
		
- vms: The vms block is used to specify one or more virtual machines that should be created and attached to the deployment. A virtual machine (VM) is a logical representation of a computer that is hosted on a node in the Grid. Each vm block in the vms block specifies the properties of a single VM. The vm block includes the following arguments:
	- name: The name of the VM, which is "tftest" in this case.
	- description: A description of the VM, which is "Terraform deployment test" in this case.
	- flist: The URL of a file list that specifies the root filesystem of the VM. The files and links are on the Threefold Hub
	- cpu: The number of CPU cores that should be allocated to the VM. In this case, the VM is allocated 4 CPU cores.
	- publicip: A flag that indicates whether the VM should be assigned a public IPv4 address. If set to true, the grid provider will assign a public IPv4 address to the VM.
	- publicip6: A flag that indicates whether the VM should be assigned a public IPv6 address. If set to true, the grid provider will assign a public IPv6 address to the VM.
	- memory: The amount of memory (in MB) that should be allocated to the VM. In this case, the VM is allocated 8192MB of memory.

		- The vm block also includes the following sub-blocks:
			- mounts:The mounts block is used to specify one or more disk mounts that should be created for the VM. A disk mount is a connection between a disk and a mount point on the VM, which allows the disk to be accessed from the VM. Each mount block in the mounts block specifies the properties of a single disk mount. The mount block includes the following arguments:
				- disk_name: The name of the disk that should be mounted.
				- mount_point: The mount point on the VM where the disk should be mounted.
				
		- env_vars: A map of environment variables that should be set on the VM. Each key-value pair in the map represents an environment variable and its value. In this case, the env_vars map includes a single environment variable called SSH_KEY, which is set to the value "ADD YOUR SSH KEY HERE".
</details>

<details>
	<summary><b>Output Blocks</b></summary>

The output blocks are used to output the values of variables or resources to the user. They are used to display the results of the Terraform run, or to make the values of certain resources or variables available to other Terraform configurations.

```
output "wg_config" {
	value = grid_network.net1.access_wg_config
}
```
This block is defining an output variable called wg_config. The value of the output will be the access_wg_config attribute of the grid_network resource with the identifier net1. This output can be used to display the WireGuard configuration for the network.
```
output "node1_vm1_ip" {
	value = grid_deployment.d1.vms[0].ip
}
```
This block is defining an output variable called node1_vm1_ip. The value of the output will be the ip attribute of the first virtual machine in the vms list of the grid_deployment resource with the identifier d1.
```
output "public_ip" {
	value = grid_deployment.d1.vms[0].computedip
}
```
This block is defining an output variable called public_ip. The value of the output will be the computedip attribute of the first virtual machine in the vms list of the grid_deployment resource with the identifier d1. This output can be used to display the public IP address of the virtual machine.
```
output "public_ip6" {
			value = grid_deployment.d1.vms[0].computedip6
}
```
This block is defining an output variable called public_ip6. The value of the output will be the computedip6 attribute of the first virtual machine in the vms list of the grid_deployment resource with the identifier d1.

The computedip6 attribute represents the public IPv6 address of the virtual machine, as computed by the grid provider. This output can be used to display the public IPv6 address of the virtual machine.
```
output "ygg_ip" {
	value = grid_deployment.d1.vms[0].ygg_ip
}
```
This block is defining an output variable called ygg_ip. The value of the output will be the ygg_ip attribute of the first virtual machine in the vms list of the grid_deployment resource with the identifier d1.

The ygg_ip attribute represents the Planetary Network IP address of the virtual machine. The Planetary Network is an experimental networking protocol that provides an encrypted IPv6 network. This output can be used to display the Planetary network IP address of the virtual machine.

I hope this explanation helps! Let me know if you have any questions.
</details>

# Resources 

<details>
	<summary><b>Single Node Network Example Main.tf</b></summary>

```
terraform {
  required_providers {
    grid = {
      source = "threefoldtech/grid"
    }
  }
}

provider "grid" {
}

resource "grid_network" "net1" {
    nodes = [3000]
    ip_range = "10.20.0.0/16"
    name = "mynetwork"
    description = "My internal Grid network"
    add_wg_access = true
}
resource "grid_deployment" "d1" {
  node = 3000
  network_name = grid_network.net1.name
  ip_range = lookup(grid_network.net1.nodes_ip_range, 3000, "")
  disks {
    name = "root"
    size = 50
  }
    vms {
    name = "tftest"
    description ="Terraform deployment test"
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist"
    cpu = 4
    publicip = true
    publicip6 = true
    memory = 8192
    mounts {
        disk_name = "root"
        mount_point = "/data"
    }
    planetary = true
    env_vars = {
      SSH_KEY ="ADD YOUR SSH KEY HERE"
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

This main.tf file is used to deploy the following resources in the Threefold Grid:

- A network called "mynetwork" with a range of IP addresses from 10.20.0.0/16. The network includes a single node with ID 3000, and it has WireGuard access enabled.
- A deployment called "d1" on node 3000. The deployment includes a single virtual machine (VM) with the following properties:
	- A root disk with a size of 50GB.
	- A VM with the name "tftest", a description of "Terraform deployment test", 4 CPU cores, 8192MB of memory, and a root filesystem specified by the file list at https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist. The VM is assigned a public IPv4 address, a public IPv6 address, and an IP address on the Planetary network. The VM has an environment variable called SSH_KEY set to the value "ADD YOUR SSH KEY HERE". The root disk is mounted at the /data mount point on the VM.
</details>


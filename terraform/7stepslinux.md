# How To Deploy A Terraform Example Configuration on the Threefold Grid from Linux in 7 steps  
 
In this tutorial, you will learn how to install Terraform, create a configuration file, and use Terraform to deploy infrastructure on the Threefold Grid. By the end of this tutorial, you will have deployed a network and two virtual machines (VMs) on the Threefold Grid.

**Prerequisites**
Before you begin, you will need the following:

A computer with the following software installed:
- Terraform
- A Threefold Grid mnemonic phrase. This is used to generate the seed for your node. You can get a mnemonic phrase by creating a Threefold Grid account.

<details>
    <summary><b>Step 1: Create a Configuration Directory</summary>
Create a new directory where you want to store your Terraform configuration. This directory can be named anything you like. In this tutorial, we will create a deployments directory and a testdeployment subdirectory inside of it.

```
mkdir deployments
mkdir deployments/testdeployment
```
</details>

<details>
    <summary><b>Step 2: Create the main.tf File</b></summary>
    
Copy the contents of the provided main.tf file and write it to the testdeployment directory you just created.

```
nano main.tf
# paste the contents of the main tf then press Ctrl+X, and confirm 
```

  <details>
        <summary><b>If the example you are deploying does not use `variable blocks` (i.e. most not created by me)  you will have to add them</b></summary>

         ```
         # ADD THE THREE VARIABLES ABOVE THE EXSITING LINES IN THE main.tf your are deploying 
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
    



          # CHANGE THESE SECTIONS OF THE main.tf to use the variables 

          provider "grid" {
          mnemonics = "${var.MNEMONICS}"
          network   = "${var.NETWORK}"  
           }
          and 
          env_vars = { 
                      SSH_KEY = "${var.SSH_KEY}" 
          } variable "MNEMONICS" {


         } 
         ```
   </details>
</details>

<details>
    <summary><b>Step 3: Initialize the Directory as a Terraform Configuration Directory</b></summary>
Open a terminal or command prompt window and navigate to the testdeployment directory where you placed the main.tf file.

```
cd deployments/testdeployment
```
Run the following command to initialize the directory as a Terraform configuration directory and install the required provider(s):

```
terraform init
```
</details>

<details>
    <summary><b>Step 4: Create the Infrastructure Resources</b></summary>
To apply the changes specified in the configuration and create the resources defined in main.tf, you will need to provide values for the variables in your configuration. You can do this by creating a .tfvars file and specifying the values you want to use.

For example, you might create a file called env1.tfvars and include the following contents:

```
MNEMONICS = "your mnemonic phrase here"
NETWORK = "main"
SSH_KEY = "your ssh key here"
```

To use this file, pass the -var-file flag to the terraform apply command, followed by the path to the file:

```
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/prod.tfvars"
```

Note: You can create multiple .tfvars files and use them to save different configurations. For example, you might create a env2.tfvars file with different values for the variables. To use this file, you would pass the path to it as the `-var-file ption when running terraform apply.

Wait for the terraform apply command to complete. This may take a few minutes. When it's finished, your infrastructure resources will be created on the Threefold Grid.
</details>

<details>
    <summary><b>Step 5: View the Output Values</b></Summary>
After the resources have been created, you can view the output values by running the following command:

```
terraform output
```

This will display the values of the output variables defined in the main.tf file. In this example, the output values include the WireGuard configuration for the network, and the IP addresses of the VMs.
</details>

<details>
    <summary><b>Step 6: Test Your Deployment</b></summary>
To test your deployment, you can SSH into the VMs using the IP addresses displayed in the output values. For example:

```
ssh ubuntu@<vm_ip_address>
```
</details>

<details>
    <summary><b>Step 7: Clean Up Your Deployment</b></summary>
When you're finished testing your deployment, you can clean up the resources you created by running the following command:

```
terraform destroy -parallelism=1 -auto-approve -var-file="/deployments/prod.tfvars"
```

This will delete the infrastructure resources from the Threefold Grid.
</details>

**Conclusion**
 
In this tutorial, you learned how to install Terraform, create a configuration file, and use Terraform to deploy infrastructure on the Threefold Grid. You also learned how to use .tfvars files to provide values for the variables in your configuration, and how to view the output values of your deployment and clean up your resources when you're finished.

I hope this tutorial was helpful! If you have any questions or need further assistance, please don't hesitate to ask. I'm happy to help you get started with Terraform and deploying your infrastructure on the Threefold Grid.

<details>
    <summary><b>Terraform Example Configuration</b></summary> 

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

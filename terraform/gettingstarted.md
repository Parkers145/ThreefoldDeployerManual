# How To Get Started Deploying With Terraform 


# What Is Terraform 

Terraform is an open-source infrastructure as code software tool created by HashiCorp. It allows users to define and provision infrastructure resources (e.g. virtual machines, network switches, containers) using a high-level configuration language called HashiCorp Configuration Language (HCL).

With Terraform, users can define the desired infrastructure resources and their dependencies in a configuration file, and use the terraform apply command to provision and manage those resources. Terraform supports a wide range of cloud providers, including AWS, Azure, Google Cloud, and many others, as well as on-premises and other infrastructure.

One of the main benefits of using Terraform is that it allows users to automate the process of provisioning and managing infrastructure resources. This can save time and reduce the risk of errors compared to manually creating and managing resources through a web console or API.

Terraform also includes features such as version control, resource dependencies, and the ability to preview and apply changes, which can help users manage their infrastructure more effectively.

# How do I use it 

# Installing Terraform:

- Go to the Terraform downloads page (https://www.terraform.io/downloads.html).
- Select the appropriate installer for your operating system (e.g. Windows, Linux, macOS).
- Run the installer and follow the prompts to install Terraform.
- Open a terminal or command prompt window.
- Type 
	```
	terraform
	```
	and press Enter to verify that the installation was successful. You should see the Terraform usage information displayed.

# Ubuntu Install Instructions 

To install Terraform on Ubuntu using apt, follow these steps:

Add the HashiCorp package signing key to your system's keyring by running the following command:
```
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
```

Add the HashiCorp APT repository to your system's package manager by running the following command:
```
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
```
Update your system's package list by running the following command:
```
sudo apt update
```
Install Terraform by running the following command:
```
sudo apt install terraform
```
Verify that the installation was successful by running the following command:
```
terraform --version
```
You should see the version of Terraform that you installed displayed.

Now you are ready to use Terraform to deploy the main.tf configuration file. Follow the steps in the previous tutorial to deploy the configuration.

# Windows Install Instructions 

To install Terraform on Windows, follow these steps:

- Go to the Terraform downloads page (https://www.terraform.io/downloads.html).
- Select the "Windows 64-bit" package and download it to your system.
- Double-click the downloaded .exe file to start the installation process.
- Follow the prompts to install Terraform.
- Once the installation is complete, open a command prompt window.
- Type terraform and press Enter to verify that the installation was successful. You should see the Terraform usage information displayed.
- Now you are ready to use Terraform to deploy the main.tf configuration file. Follow the steps in the previous tutorial to deploy the configuration.

# Setting your Enviroment variables 

Next, you would need to create a file called env.tfvars in the /deployments directory, which should contain the values for the variables defined in main.tf. For example:

```
MNEMONICS = "abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon abandon"
NETWORK = "main"
SSH_KEY = " Your SSH KEY here"
```

You can use multiple .tfvars files to save different configurations in the /deployments directory. To use a specific .tfvars file when running the terraform apply command, you can specify the path to the file using the -var-file flag.

For example, if you have three .tfvars files in the /deployments directory:

prod.tfvars
stage.tfvars
dev.tfvars
You can use the following commands to apply the configuration using the different .tfvars files:

```
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/prod.tfvars"
```
This command will apply the configuration using the values specified in the prod.tfvars file.

```
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/stage.tfvars"
```
This command will apply the configuration using the values specified in the stage.tfvars file.

```
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/dev.tfvars"
```

This command will apply the configuration using the values specified in the dev.tfvars file.

This way, you can use different .tfvars files to save different configurations and easily switch between them by specifying the path to the desired file when running the terraform apply command.



# Deploying the configuration on Linux:

- Create a new directory where you want to store your Terraform configuration.
```
mkdir /deployments
mkdir /deployments/testdeployment
```

- copy the main.tf file and write it to the directory you just created.
```
nano main.tf
```

# paste the contents of the main tf then press Ctrl+X, and confirm 


- If the example you are deploying does not use `variable blocks` (i.e. most not created by me)  you will have to add them
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

- Open a terminal or command prompt window and navigate to the directory where you placed the main.tf file.
```
cd /deployments/testdeployment
```

- Run the following command to initialize the directory as a Terraform configuration directory and install the required provider(s):

```
terraform init
```

- Run the following command to apply the changes specified in the configuration and create the resources defined in main.tf:

```
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/prod.tfvars"
```

Wait for the command to complete

# Deploying Configuration on Windows 

To create and use Terraform to deploy a configuration file on Windows, follow these steps:

- Create a new directory where you want to store your Terraform configuration. For example:
```
mkdir C:\deployments
mkdir C:\deployments\testdeployment
```
- Open a text editor and create a new file called main.tf.

- Add the example main.tf below and save the file as main.tf 

- If the example you are deploying does not use `variable blocks` (i.e. most not created by me)  you will have to add them
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

- Open a command prompt window and navigate to the testdeployment directory. For example:

```
cd C:\deployments\testdeployment
```
- Run the following command to initialize the directory as a Terraform configuration directory and install the required provider(s):
```
terraform init
```
- Create a file called env.tfvars in the same directory as the main.tf file, and add the values for the variables defined in main.tf.

- Run the following command to apply the changes specified in the configuration and create the resources defined in main.tf:

```
terraform apply -parallelism=1 -auto-approve -var-file="C:\\deployments:\yourfile.tfvars"
```
Wait for the command to complete.


# Example Main.tf

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

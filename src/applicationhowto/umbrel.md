

***Umbrel Demostration Videos, Tutorial Steps Videos to Come*** 


During one of the recent Comuunity Q&A and Tech Calls, one of our community members brought up installing [Umbrel](https://umbrel.com/) on The Threefold Grid, I found this to be an amazing resource that allows users to self host their own cloud. Combining this with the abilities of the grid creates a truly incredible resource.  

For this tutorial we will be using  
- Full VM deployment with 4 cores, 8000 mb of ram and 900 gb of storage
- Ubuntu 22.04 image
- Terraform 
- Wiregaurd 
- Umbrel  
- Putty / SSH client of your choice. 

# Steps to Prepare Your Local Machine 

There are a few things you will need installed on your local machine, 

<details>
    <summary><b> Windows Local Machine Preparations </b></summary>
&nbsp;
   <details>
      <summary><b>Windows - Install WSL 2 and Ubuntu 22.04 in Windows</b></summary>

- Make sure you have Windows 10 version 2004 or higher installed. You can check your version by going to Settings > System > About.
- Open the Windows PowerShell as an administrator and run the command 
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart

dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

dism.exe /online /enable-feature  /featurename:Microsoft-Hyper-V /all /norestart

# This will enable the Hyper-V, WSL and the Virtual Machine Platform features on your Windows machine.
```
- Download and install the [Linux Kernel Update Package](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
- Set default version to WSL 2 in Powershell
```
wsl --set-default-version 2
```
- Open the Microsoft Store and search for "Ubuntu 22.04 LTS" and select the version provided by Canonical Group Limited, this will download and install the Ubuntu distro on your machine.
- Open the Ubuntu app from your Start menu, this will open the Ubuntu terminal and will take a few minutes to complete the setup.
- Once the setup is complete, you will be prompted to create a new user and password.
- Run sudo apt update and sudo apt upgrade to update and upgrade all the packages on your system.
- Once done, you can now use Ubuntu 22.04 LTS on Windows through the WSL 2.

Please note that WSL 2 requires virtualization support, so make sure that virtualization is enabled in your system's BIOS settings.

That's it! You have successfully installed WSL 2 and Ubuntu 22.04 LTS on your Windows machine. Now you can use Ubuntu commands and install any package you like using apt command.
  </details>
 
  <details>
      <summary><b>Windows -  Install Terraform</b></summary> 

We Will Be installing Terraform In WSL, 

To install Terraform on WSL using apt, follow these steps:

Add the HashiCorp package signing key to your system's keyring by running the following command:
```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
```
Add the HashiCorp APT repository to your system's package manager by running the following command:
```
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
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

Now you are ready to use Terraform to deploy the main.tf configuration file. 
  </details>

  <details>
      <summary><b>Windows - Install Putty</b></summary> 

- Download PuTTY executable file from the official website: https://www.putty.org/
- Double-click on the downloaded .exe file to start the installation process
- Follow the instructions on the installation wizard to complete the setup
- Once installed, you can open PuTTY from the Start menu or desktop shortcut

  </details>

  <details>
      <summary><b>Windows -  Install Wiregaurd</b></summary> 

- Download the WireGuard installation package for Windows from the official website: https://wireguard.com/install/
- Double-click on the downloaded .msi file to start the installation process
- Follow the on-screen instructions to complete the installation
- Once installed, you can open the WireGuard application from the Start menu or desktop shortcut

  </details>
</details>

<details>
  <summary><b> Linux Local Machine Preparations </b></summary>
&nbsp;
  <details>
      <summary><b>Linux -  Install Terraform</b></summary> 

To install Terraform on Ubuntu using apt, follow these steps:

Add the HashiCorp package signing key to your system's keyring by running the following command:
```
wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
```
Add the HashiCorp APT repository to your system's package manager by running the following command:
```
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
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

Now you are ready to use Terraform to deploy the main.tf configuration file. 
  </details>

  <details>
      <summary><b>Linux -  Install Wiregaurd</b></summary> 

- Add the WireGuard PPA to your system by running the following command in terminal:
    sudo add-apt-repository ppa:wireguard/wireguard
- Update the package list with the following command:
    sudo apt update
- Install the WireGuard package with the following command:
    sudo apt install wireguard
- Load the WireGuard module into the kernel with the following command:
    sudo modprobe wireguard


  </details>
</details>

 
# Steps to Deploy Your Workload 

If you are working in Linux these steps will be performed in the Terminal, in Windows we will be performing these tasks in WSL 

<details>
&nbsp;
    <summary><b>Create a Directory to Store Your Terraform Deployments</b></summary>

Create a new directory where you want to store your Terraform deployments. This directory can be named anything you like. In this tutorial, we will create a deployments directory in this step and your deployment directory in the next. 

```
mkdir deployments
```
</details>

<details>
&nbsp;
    <summary><b>Create a Directory to Store Your Umbrel Deployment</b></summary>

Create a new directory where you want to store your Umbrel Deployment. This directory can be named anything you like. In this tutorial, we will create a deployments directory and a testdeployment subdirectory inside of it.

```
mkdir deployments/umbrel
```
</details>

<details>
&nbsp;
    <summary><b>Create Your Env.tfvars file</b></summary>

To apply the changes specified in the configuration and create the resources defined in main.tf, you will need to provide values for the variables in your configuration. You can do this by creating a .tfvars file and specifying the values you want to use.

For example, you might create a file called env1.tfvars and include the following contents:

```
MNEMONICS = "your mnemonic phrase here"
NETWORK = "main"
SSH_KEY = "your ssh key here"
```

to do this, we will use nano to create the file in the top level deployments directory 
```
nano /deployments/production.tfvars
```

</details>

<details>
&nbsp;
    <summary><b> Create Your Main.Tf </b></Summary>

you will create a "main.tf" file in your umbrel deployment directory, This file is the "recipe" for the how the grid will create your VM. I have provided an example below, in order to use it we will use nano to copy the contents into a new file in the umbrel deployment directory

```
nano /deployments/umbrel/main.tf

# Paste to contents of your main.tf into the window and press Ctrl+X to save and Y to Confirm
```

  <details>
    <summary> The "Example" Umbrel Main.tf </summary>

```console

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
    network   = "${var.NETWORK}"  
}
resource "grid_network" "net1" {
    nodes = [3807]
    ip_range = "10.0.0.0/16"
    name = "Net1"
    description = "MyNetwork1"
    add_wg_access = "true"
}
resource "grid_deployment" "D1" { 
  node = 3807
  network_name = grid_network.net1.name 
  disks { 
	 name = "Disk1" 
	 size = "25" 
  } 
  disks { 
	 name = "Disk2" 
	 size = "900" 
  } 
    vms { 
    name = "VM1" 
    description = "MyVm1" 
    flist = "https://hub.grid.tf/tf-official-vms/ubuntu-22.04-lts.flist" 
    cpu = "6" 
    publicip = "false" 
    publicip6 = "false" 
    memory = "8000" 
    mounts { 
	 disk_name = "Disk1" 
	 mount_point = "/data1" 
	}
	mounts { 
	 disk_name = "Disk2" 
	 mount_point = "/data2" 
	}
	planetary = "true" 
    env_vars = { 
      SSH_KEY = "${var.SSH_KEY}" 
    } 
  } 
} 

output "wg_config1" { 
  value = grid_network.net1.access_wg_config 
} 
output "ygg_ip1" { 
   value = grid_deployment.D1.vms[0].ygg_ip 
}
output "wiregaurd_ip" {
  value = grid_deployment.D1.vms[0].ip
}
```

</details>

<details>
    <summary> Create your own Main.TF </summary>

If you would like to create your own main.tf there are a couple things you should ensure it has 
- output variable to display both the wiregaurd configuration and the VMs Wiregaurd Address.
- adequate resources for running Umbrel 

<details>
    <summary> Minnimum Specifications </summary>

The absolute minnimum specifications for Umbrel are 

- 2 Cores 
- 2094 Memory
- 25 GB disk 
- Ubuntu OS

It is likely you may need more then this depending on your intended use. 
</details>

<details>
    <summary> Recommended Specifications </summary>

For the best Experience I recommend these minnimum settings 

- 4 Cores
- 8094 Memory
- 900 GB Storage Disk 
- 100 GB OS DISK 
- Ubuntu 22.04

If you're running Umbrel OS on Bitcoin mainnet (default), the storage disk should be at least 750 GB in size (we recommend 1 TB+) so it can store the whole Bitcoin blockchain.
  </details>

</details>
</details>

<details>
&nbsp;
    <summary><b>Deploy Your Main.tf</summary>

  <details>
    <summary> Initialize The Deployment Directory </summary>

In order to prepare the Umbrel Deployment directory once we have inserted the main.tf, we will switch to the directory 

```console
cd /deployments/umbrel
```

we will then tell Terraform to initialized the directory 

```console
terraform init
```
  </details>
  <details>
  &nbsp;
    <summary> Apply Your Main.tf </summary>


```console
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/production.tfvars"
```

Note: You can create multiple .tfvars files and use them to save different configurations. For example, you might create a env2.tfvars file with different values for the variables. To use this file, you would pass the path to it as the `-var-file ption when running terraform apply.

Wait for the terraform apply command to complete. This may take a few minutes. When it's finished, The VM we will be installing umbrel on will be created on the Threefold Grid.
  </details>
</details>


# Steps to Connect to your Deployment 

Now we will need to connect to our deployed workload, for this tutorial we will be making our connection through Wiregaurd that we installed earlier

<details>
&nbsp;
    <summary><b> Connect to the Wiregaurd Network</b></Summary>



<details>
    <summary><b> Retrieve Wiregaurd Configuration from Terraform </b></Summary>


This information is printed in the console after you run the "terraform apply" command, If you have lost the window navigate to your umbrel deployment directory 

```console
cd /deployments/umbrel
```
then run the "terraform output" command 

```console
terraform output
```

you will see a block of data that looks like this 

```console
[Interface]
Address = 100.64.0.2
PrivateKey = "private key"
[Peer]
PublicKey = "public key"
AllowedIPs = 10.0.0.0/16, 100.64.0.0/16
PersistentKeepalive = 25
Endpoint = 195.192.213.240:7607
```

copy this file we will pasting it into a file in the next step. 
</details>

<details> 
    <summary><b>Connect to Wiregaurd Network From Local Machine In Windows</b></summary>

- Create a new Text file with the text editor of your choice (notepad works)
- Paste the contents we copied in the last step into the file 
- Save the file with the .conf extension (wg1.conf) the name of the file will be the name of the connection 
- Open the WireGuard application from the Start menu or desktop shortcut
- Click on the add tunnel button to create a new connection 
- Select the text file you just created an open
- Connect to the VPN by clicking on the toggle switch in the WireGuard application.

</details>

<details> 
    <summary><b>Connect to Wiregaurd Network From Local Machine In linux</b></summary>

- Create a new Text file with the text editor of your choice (notepad works)
- Paste the contents we copied in the last step into the file 
- Save the file with the .conf extension (wg1.conf) the name of the file will be the name of the connection 
- Open the WireGuard application from the Start menu or desktop shortcut
- Click on the add tunnel button to create a new connection 
- Select the text file you just created an open
- Connect to the VPN by clicking on the toggle switch in the WireGuard application.

</details>
</details>

<details>
&nbsp;
    <summary><b> Connect to your VM via SSH</b></summary>

<details>
    <summary>SSH VM From Windows using Putty</summary>


https://youtu.be/NEXuWCggFB8


if you�re running Windows, you might want to use Putty to connect to your Grid VMs. This is possible, but you will need to make sure the ssh key you created your playground profile with is save in the right format. Here�s a quick step by step:


<details>
	<summary><b>Format your SSH Key For Putty Using PuttyGen</b></summary>

First run PuttyGen. Even if you already have a key you want to use, this is the best way to get the public key in the proper format. If you don�t already have a key, choose RSA and hit generate. When you�re done, hit Save private key and write the .ppk file to disk. We�ll use this file in the next step to connect.

If you already had a key or want to return to this step later, hit the Load button and select the ppk file. At the top of the PuttyGen window, you�ll see a field with the public key:

![image](https://user-images.githubusercontent.com/44621168/214651082-2b45b153-2a9b-4026-a627-1dacee5fcb77.png)

Copy the public key from this window, making sure you get everything between ssh-rsa and the key comment rsa-key... in this case. Paste that into the ssh public key field in the playground or Terraform file for your deployment. In case of the playground, also save your profile after doing this.

*Copying and pasting the public key from your ppk file will not work. There are line breaks in the file that get interpreted as extra information when they get passed to the VM. You might have success removing the line breaks manually, but copying the public key from this gui window is the simplest and most reliable way to make this work.*
</details>

Once you have your SSH key Sorted, You will be ready to

<details>
	<summary><b>Connect with Putty</b></summary>

After you�ve added the key to your playground profile or Terraform file, create your deployment. There�s no way to change the SSH key in an existing deployment, you must delete and redeploy. Copy the IP address once the deployment is successful and then open Putty.

In Putty�s config screen, navigate to Connection > SSH > Auth:

![image](https://user-images.githubusercontent.com/44621168/214651140-7dd0999b-44cb-40fd-9c00-034aa550d8af.png)

Hit Browse� and select your ppk file. Then go to Session at the top of the left nav bar and enter your VMs IP address in the Host Name (or IP address) field. Then hit the Open button at the bottom of the window to start your session. When you are prompted for a user name, enter root and you should then get access to a terminal with no password prompt.

If you�re prompted for a password, something went wrong and you won�t be able to log in. Go back and check the steps above, then feel free to post questions or problems in this thread.
  </details>
</details>

<details>
    <summary> SSH VM from Linux </summary>

Linux is natively compatible with the grid and can ssh workloads from the terminal with no additional software, once your are connected to the wiregaurd network just open a terminal and run 

```console
ssh root@your.vms.wiregaurd.ip
```

</details>
</details>

# Steps To Install Umbrel on Your Deployment 

Next, we will install Umbrel on the deployment we just created

<details>
&nbsp;
    <summary><b>Update and Upgrade Your VM</b></summary> 

After Connecting to your VM via SSH, run these commands in your terminal for Ubuntu 22.04 

```console
apt update && apt upgrade -y 
```

If you encouter an error about a grub update on a pink screen, simply press yes and proceed, this is a incompatability between that update and the hypervisor firmware, it will not affect peformance, but this error can be avoided by running this command prior to updating 

```console
apt-mark hold grub-efi-amd64-signed
```


   <details>
            <summary>Jump to Update and Upgrade Your VM Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=199s

   </details>

   <details>
            <summary>Jump to Update and Upgrade Your VM Expected Behavior Section</summary>

Console Input 


Command Success 


   </details>

</details>

<details>
&nbsp;
    <summary><b>Restart Your VM</b></summary> 

```console
reboot -f
```

<details>
        <summary>Jump to Restart Your VM Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=236s

   </details>

   <details>
            <summary>Jump to Restart Your VM Expected Behavior Section</summary>

Console Input 


Command Success 
</details>
</details>

<details>
&nbsp;
    <summary><b> Create A New User </b></summary>

We will want to create a new user and make that user a sudoer (admin) to create the New User use 

```console
adduser yourusername
```

to make that user a sudoer (admin) you will use 

```console
usermod -aG sudo yourusername
```

</details>

<details>
&nbsp;
    <summary><b> Switch to New User </b></summary> 

We will to install/run umbrel as the new user that we just created in order to switch to that user to execute the commands we will use 

```console
su yourusername
```

</details>

<details>
&nbsp;
    <summary><b>Install Umbrel</b></summary>

Umbrel Includes single command install functionality, If you've made it to this point breathe a sigh of relief once command to go, run 

```console
curl -L https://umbrel.sh | bash
```

This will install Umbrel and anytime you are connected to the wiregaurd network you will be able to access the services provided from your regular web browser at the ip addresses displayed when this script finishes
</details>

# Steps to Attach your Umbrel Deployment to Your Home  Network 

The major benefit to using wiregaurd in the way we have above is the ability to create a private, persistent, link between your home network and your Umbrel deployment, This will require your router to support connecting to Wiregaurd Networks, but once you have performed this step any devices on your network will be able to access the Umbrel Here's some examples of how to do that, 

<details>
&nbsp;
    <summary><b> Connecting an OpenWRT Router to your WireGaurd Network </b></summary>

[Openwrt Wiki Page](https://openwrt.org/docs/guide-user/services/vpn/wireguard/client)

1. Install WireGuard on OpenWRT:
   - Connect to your OpenWRT router via SSH or web interface
   - Install the WireGuard packages: 
     `opkg update`
     `opkg install luci-app-wireguard kmod-wireguard wireguard-tools`
     
2. Configure the WireGuard interface:
   - Go to the Network > Interfaces menu in the LuCI web interface
   - Click on the "Add new interface" button and select "WireGuard"
   - Fill in the interface name, private key, and peer information
   - Set the firewall zone for the WireGuard interface
   
3. Configure the routing:
   - Go to the Network > Routing menu in the LuCI web interface
   - Create a new route, select the WireGuard interface as the source and set the desired target network and gateway
   
4. Enable the WireGuard interface:
   - Go to the Network > Interfaces menu in the LuCI web interface
   - Click on the "Edit" button for the WireGuard interface
   - Change the status to "Enabled"
   - Save the changes and apply them
   
5. Test the connection:
   - Verify that the WireGuard interface has been assigned an IP address
   - Ping a remote host to verify that the routing is working
   - Check the WireGuard logs for any errors or warnings

Note: Make sure to use the information from your Terrafom Output for this Configuration
</details>

<details>
&nbsp;
    <summary><b> Connecting a Pfsense Router to Your WireGaurd Network</b></summary>

[Pfsense Wiregaurd Wiki Page](https://docs.netgate.com/pfsense/en/latest/recipes/wireguard-ra.html)

</details>

<details>
&nbsp;
    <summary><b> Connecting an Asus Router to Your Wiregaurd Network </b></summary>

[Asus FAQ Page](https://www.asus.com/support/FAQ/1048282/)
</details>

<details>
&nbsp;
    <summary><b> Connecting a Gl.Inet router to your Wiregaurd Network</b></summary>

[GL.Inet Wiregaurd Setup Page](https://docs.gl-inet.com/en/3/tutorials/wireguard_client/)

</details>


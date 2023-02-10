

***Umbrel Demostration Videos, Tutorial Steps Videos to Come*** 


During one of the recent Comuunity Q&A and Tech Calls, one of our community members brought up installing [Umbrel](https://umbrel.com/) on The Threefold Grid, I found this to be an amazing resource that allows users to self host their own cloud. Combining this with the abilities of the grid creates a truly incredible resource.  

For this tutorial we will be using  
- Full VM deployment with 4 cores, 8000 mb of ram and 900 gb of storage
- Ubuntu 22.04 image
- Terraform 
- Wiregaurd 
- Umbrel  
- WSL (windows) 

___
## Steps to Prepare Your Local Machine 
___

There are a few things you will need installed on your local machine, 

- <details>
    <summary>Windows Local Machine Preparations</summary>

    ___
    - <details>
          <summary>Windows - Install Windows Subsystem For Linux</summary>
        
        ___
        Open the Windows PowerShell as an administrator  
    
        - First, we will install WSL 
         
            ```console
            wsl --install
            ```

        - Next, we will ensure that we have an up to date kernel with 

            ```console
            wsl --update
            ```
        - Then we will ensure that we have enabled the Windows features Virtual Machine Platform 

            ```console
            dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

            ```

        - Lastly, we will open the Start menu and find the Microsoft Store
            - Search the store for "Ubuntu"
            - Click get and allow the setup to complete
            - Restart Your PC

        Please note that WSL 2 requires virtualization support, so make sure that virtualization is enabled in your system's BIOS settings.

        That's it! You have successfully installed WSL 2 and Ubuntu 22.04 LTS on your Windows machine. Now you can use Ubuntu commands and install any package you like using apt command.
        ___

        </details>
 
    - <details>
          <summary>Windows - Install Terraform</summary> 
        
        ___
        We will Be installing Terraform In WSL, 

        To install Terraform on WSL using apt, follow these steps:

        Add the HashiCorp package signing key to your system's keyring by running the following command:

        ```console
        wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
        ```

        Add the HashiCorp APT repository to your system's package manager by running the following command:

        ```console
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        ```

        Update your system's package list by running the following command:

        ```console
        sudo apt update
        ```

        Install Terraform by running the following command:

        ```console
        sudo apt install terraform
        ```

        Verify that the installation was successful by running the following command:

        ```console
        terraform --version
        ```

        You should see the version of Terraform that you installed displayed.

        Now Terraform is ready to be used in later steps
        ___
        </details>

    - <details>
          <summary>Windows - Install Wiregaurd</summary> 

        ___
        - Download the WireGuard installation package for Windows from the official website: https://wireguard.com/install/
        - Double-click on the downloaded .msi file to start the installation process
        - Follow the on-screen instructions to complete the installation
        - Once installed, you can open the WireGuard application from the Start menu or desktop shortcut
        ___
      </details>

    - <details>
        <summary>Generate SSH key and Import to WSL</summary>

        ___
        1.) Open the Windows Command Prompt or PowerShell and run the command ssh-keygen. This will generate a new SSH key pair on your Windows machine and save it to C:\users\youruser\.ssh

        ```console
        ssh-keygen
        ```

        2.) Open your Installed WSL and switch to the root accound 

        ```console
        su root
        ```

        3.) Navigate to the directory your ssh key files are saved in typically /mnt/c/users/youruser/.ssh 

        ```console
        cd /mnt/c/users/parkers/.ssh
        ```

        4.) Create a directory for your SSH KEYS 

        ```console
        mkdir /home/parker/.ssh

        # (/home/user/.ssh) if you want to use the key without being root 

        # (/root/.ssh) if yo want the keys to only be accesible by the wsl root account. 
        ```

        5.) Copy your key files to the appropriate directory, typically /home/youruser/.ssh

        ```console
        cp /mnt/c/users/parkers/.ssh/id_rsa.pub /home/youruser/.ssh/id_rsa.pub
        cp /mnt/c/users/parkers/.ssh/id_rsa /home/youruser/.ssh/id_rsa
        ```

        6.) Properly own the key files in WSL 

        ```console
        chown parker:parker /home/youruser/.ssh/id_rsa.pub
        chown parker:parker /home/youruser/.ssh/id_rsa
        ```

        7.) Protect your keys 

        ```console
        # Set the .ssh directory and public key to 644 
        chmod 644 /home/user/.ssh
        chmod 644 /home/user/.ssh/id_rsa.pub

        # Set your Private Key so that only you can read it by making it 600
        chmod 600 /home/user/.ssh/id_rsa.pub
        ```
        ___
        </details>
        
        ___
</details>

- <details>
      <summary>Linux Local Machine Preparations</summary>
    
    ___
    - <details>
          <summary>Linux - Install Terraform</summary> 
        
        ___
        To install Terraform on Ubuntu using apt, follow these steps:

        Add the HashiCorp package signing key to your system's keyring by running the following command:

        ```console
        wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
        ```

        Add the HashiCorp APT repository to your system's package manager by running the following command:

        ```console
        echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
        ```

        Update your system's package list by running the following command:

        ```console
        sudo apt update
        ```

        Install Terraform by running the following command:

        ```console
        sudo apt install terraform
        ```

        Verify that the installation was successful by running the following command:

        ```console
        terraform --version
        ```

        You should see the version of Terraform that you installed displayed.

        Now you are ready to use Terraform to deploy the main.tf configuration file. 
        ___

        </details>

    - <details>
          <summary>Linux - Install Wiregaurd</summary> 
        
        ___
        Update the package list with the following command:
    
        ```console
        sudo apt update
        ```
        Install the WireGuard package with the following command:
    
        ```console
        sudo apt install wireguard
        ```
        ___

        </details>

        ___
</details>

___ 
## Steps to Deploy Your Workload 
___

If you are working in Linux these steps will be performed in the Terminal, in Windows we will be performing these tasks in WSL 

- <details>
    <summary>Create a Directory to Store Your Terraform Deployments</summary>

    ___
    Create a new directory where you want to store your Terraform deployments. This directory can be named anything you like. In this tutorial, we will create a deployments directory in this step and your deployment directory in the next. 

    ```console
    mkdir deployments
    ```
    ___
</details>

- <details>
    <summary>Create a Directory to Store Your Umbrel Deployment</summary>

    ___
    Create a new directory where you want to store your Umbrel Deployment. This directory can be named anything you like. In this tutorial, we will create a deployments directory and a testdeployment subdirectory inside of it.

    ```console
    mkdir deployments/umbrel
    ```
    ___

</details>

- <details>
    <summary>Create Your Env.tfvars file</summary>

    ___
    To apply the changes specified in the configuration and create the resources defined in main.tf, you will need to provide values for the variables in your configuration. You can do this by creating a .tfvars file and specifying the values you want to use.

    For example, you might create a file called env1.tfvars and include the following contents:

    ```console
    MNEMONICS = "your mnemonic phrase here"
    NETWORK = "main"
    SSH_KEY = "your ssh key here"
    ```

    to do this, we will use nano to create the file in the top level deployments directory 

    ```console
    nano /deployments/production.tfvars
    ```
    ___

</details>

- <details>
    <summary>Create Your Main.Tf</Summary>

    ___
    you will create a "main.tf" file in your umbrel deployment directory, This file is the "recipe" for the how the grid will create your VM. I have provided an example below, in order to use it we will use nano to copy the contents into a new file in the umbrel deployment directory

    ```console
    nano /deployments/umbrel/main.tf

    # Paste to contents of your main.tf (or the example directly below) into the window and press Ctrl+X to save and Y to Confirm
    ```
    ___

    - <details>
        <summary>The "Example" Umbrel Main.tf</summary>

        ___
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
        ___
       </details>

    - <details>
        <summary>Create your own Main.TF </summary>

        ___
        If you would like to create your own main.tf there are a couple things you should ensure it has 
        - output variable to display both the wiregaurd configuration and the VMs Wiregaurd Address.
        - adequate resources for running Umbrel 
        ___

      - <details>
            <summary>Minnimum Specifications </summary>

          ___
          The absolute minnimum specifications for Umbrel are 

          - 2 Cores 
          - 2094 Memory
          - 25 GB disk 
          - Ubuntu OS

          It is likely you may need more then this depending on your intended use. 
          ___
          </details>

      - <details>
            <summary>Recommended Specifications </summary>

          ___
          For the best Experience I recommend these minimum settings 

          - 4 Cores
          - 8094 Memory
          - 900 GB Storage Disk 
          - 100 GB OS DISK 
          - Ubuntu 22.04

          If you're running Umbrel OS on Bitcoin mainnet (default), the storage disk should be at least 750 GB in size (we recommend 1 TB+) so it can store the whole Bitcoin blockchain.
          ___
           </details>
      </details>
</details>

- <details>
    <summary>Deploy Your Main.tf</summary>

    ___
    - <details>
          <summary>Initialize The Deployment Directory</summary>
    
        ___
        In order to prepare the Umbrel Deployment directory once we have inserted the main.tf, we will switch to the directory 

        ```console
        cd /deployments/umbrel
        ```

        we will then tell Terraform to initialized the directory 

        ```console
        terraform init
        ```
        ___
       </details>
    - <details>
      <summary>Apply Your Main.tf</summary>

        ___
        ```console
        terraform apply -parallelism=1 -auto-approve -var-file="/deployments/production.tfvars"
        ```

        Note: You can create multiple .tfvars files and use them to save different configurations. For example, you might create a env2.tfvars file with different values for the variables. To use this file, you would pass the path to it as the `-var-file ption when running terraform apply.

        Wait for the terraform apply command to complete. This may take a few minutes. When it's finished, The VM we will be installing umbrel on will be created on the Threefold Grid.
        ___
     </details>
</details>

___
## Steps to Connect to your Deployment 
___

Now we will need to connect to our deployed workload, for this tutorial we will be making our connection through Wiregaurd that we installed earlier

- <details>
    <summary>Connect to the Wiregaurd Network</Summary>

    ___
    - <details>
        <summary>Retrieve Wiregaurd Configuration from Terraform</Summary>

        ___
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
        ___
        </details>

    - <details> 
         <summary>Connect to Wiregaurd Network From Local Machine In Windows</summary>

        ___
        - Create a new Text file with the text editor of your choice (notepad works)
        - Paste the contents we copied in the last step into the file 
        - Save the file with the .conf extension (wg1.conf) the name of the file will be the name of the connection 
        - Open the WireGuard application from the Start menu or desktop shortcut
        - Click on the add tunnel button to create a new connection 
        - Select the text file you just created an open
        - Connect to the VPN by clicking on the toggle switch in the WireGuard application.
        ___

        </details>

    - <details> 
        <summary>Connect to Wiregaurd Network From Local Machine In linux</summary>

        ___
        - Create a new Wiregaurd Configuration at /etc/wiregaurd/wg0.conf
            ```console
            nano /etc/wiregaurd/wg0.conf
            ```
        - Paste the contents we copied in the last step into the file 
        - Press Ctrl+X to save  
        - Enable the Wiregaurd connection
            ```console
            sudo wg-quick up wg0
            ```
        ___

        </details>
</details>

- <details>
    <summary>Connect to your VM via SSH</summary>

    ___
    - <details>
        <summary>SSH VM From Windows using WSL</summary>

        ___
        To connect you will type SSH followed by root@yourvmsipv4 or root@[yourvmsipv6]
        ```console
        ssh root@162.205.204.230
        ssh root@[2a02:16a8:dc:501:74d4:eeff:fe1b:64c5]
        ```
        ___

        </details>

    - <details>
        <summary> SSH VM from Linux </summary>

        ___
        Linux is natively compatible with the grid and can ssh workloads from the terminal with no additional software, once your are connected to the wiregaurd network just open a terminal and run 

        ```console
        ssh root@your.vms.wiregaurd.ip
        ```
        ___

       </details>
</details>

___
## Steps To Install Umbrel on Your Deployment 
___

Next, we will install Umbrel on the deployment we just created

- <details>
    <summary><b>Update and Upgrade Your VM</b></summary> 

    ___
    After Connecting to your VM via SSH, run these commands in your terminal for Ubuntu 22.04 

    ```console
    apt update && apt upgrade -y 
    ```

    If you encouter an error about a grub update on a pink screen, simply press yes and proceed, this is a incompatability between that update and the hypervisor firmware, it will not affect peformance, but this error can be avoided by running this command prior to updating 

    ```console
    apt-mark hold grub-efi-amd64-signed
    ```
    ___

</details>

- <details>
    <summary><b>Restart Your VM</b></summary> 

    ___
    ```console
    reboot -f
    ```
    ___

</details>

- <details>
    <summary><b> Create A New User </b></summary>

    ___
    We will want to create a new user and make that user a sudoer (admin) to create the New User use 

    ```console
    adduser yourusername
    ```

    to make that user a sudoer (admin) you will use 

    ```console
    usermod -aG sudo yourusername
    ```
    ___

</details>

- <details>
    <summary><b> Switch to New User </b></summary> 

    ___
    We will want to install/run umbrel as the new user that we just created in order to switch to that user to execute the commands we will use 

    ```console
    su yourusername
    ```
    ___

</details>

- <details>
    <summary><b>Install Umbrel</b></summary>

    ___
    Umbrel Includes single command install functionality, If you've made it to this point breathe a sigh of relief once command to go, run 

    ```console
    curl -L https://umbrel.sh | bash
    ```

    This will install Umbrel and anytime you are connected to the wiregaurd network you will be able to access the services provided from your regular web browser at the ip addresses displayed when this script finishes
    ___

</details>

___
## Steps to Attach your Umbrel Deployment to Your Home  Network 
___

The major benefit to using wiregaurd in the way we have above is the ability to create a private, persistent, link between your home network and your Umbrel deployment, This will require your router to support connecting to Wiregaurd Networks, but once you have performed this step any devices on your network will be able to access the Umbrel Here's some examples of how to do that, 

- <details>
    <summary><b> Connecting an OpenWRT Router to your WireGaurd Network </b></summary>

    ___
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
    ___

</details>

- <details>
    <summary><b> Connecting a Pfsense Router to Your WireGaurd Network</b></summary>

    ___
    [Pfsense Wiregaurd Wiki Page](https://docs.netgate.com/pfsense/en/latest/recipes/wireguard-ra.html)
    ___
</details>

- <details>
    <summary><b> Connecting an Asus Router to Your Wiregaurd Network </b></summary>

    ___
    [Asus FAQ Page](https://www.asus.com/support/FAQ/1048282/)
    ___
</details>

- <details>
    <summary><b> Connecting a Gl.Inet router to your Wiregaurd Network</b></summary>

    ___
    [GL.Inet Wiregaurd Setup Page](https://docs.gl-inet.com/en/3/tutorials/wireguard_client/)
    ___
</details>


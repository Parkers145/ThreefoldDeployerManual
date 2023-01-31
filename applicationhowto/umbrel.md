**The End Result of This Tutorial**


***Umbrel Demostration Video*** 


During one of the recent Comuunity Q&A and Tech Calls, one of our community members brought up installing [Umbrel](https://umbrel.com/) on Threefold Grid, I found this to be an amazing resource that allows users to self host their own cloud. Combining this with the abilities of the grid creates a truly incredible resource.  

For this tutorial we will be using  
- Full VM deployment with 4 cores, 8000 mb of ram and 900 gb of storage
- Ubuntu 22.04 image
- Terraform 
- Wiregaurd 
- Umbrel  
- Putty / SSH client of your choice. 

# Steps to setup your Grid Accounts

If you have never deployed on the threefold grid you will have to set a few things up

<details>
	<summary><b>Install the Polkadot-Js Exstension</b></summary>

Open Google Chrome and go to the Chrome Web Store by typing "chrome.google.com/webstore" in the address bar.

- 1.) Search for "polkadot-js" in the search bar and select the extension from the results.
- 2.) Click on the "Add to Chrome" button to install the extension.
- 3.) A pop-up window will appear asking for permission to install the extension. Click "Add extension" to continue.
- 4.) Once the installation is complete, you will see a notification in the top right corner of your browser that the extension has been added.
- 5.) To access the extension, click on the puzzle icon in the top right corner of your browser and select "polkadot-js"
- 6.) Once the extension is open, you will be prompted to connect to a polkadot-js enabled node. You can either connect to the default provided node or add your own custom node by clicking on the "Advanced settings" button.
- 7.) Once you are connected, you will be able to interact with the Polkadot network using the extension's built-in features such as viewing account balances and transaction history, and creating and signing transactions.
    - hold off on creating wallet for now untill youve read the next step. 
Note: Make sure you have the latest version of Google Chrome installed to use this extension.
</details>

<details>
	<summary><b>Create Your Wallet</b></summary>

You have Three options for creating this wallet
	
  <details>
	<summary>Use an Existing Stellar Wallet Nmeonic</summary>

Open the Polkadot-js extension in Google Chrome by clicking on the puzzle icon in the top right corner of the browser and selecting "polkadot-js".

- 1.) In the extension, click on the "Accounts" tab and then select "Import Accounts"
- 2.) Select "Stellar" from the list of supported chains.
- 3.) Enter your Stellar mnemonic phrase in the field provided.
- 4.) Click on the "Import" button to import your Stellar account into the Polkadot-js extension.
- 5.) Once the import is complete, you will see your imported Stellar account listed under the "Accounts" tab.
- 6.) To confirm that the import was successful, you can check the balance of your imported Stellar account by selecting it and then clicking on the "Account Details" button.
- 7.)To use the imported account for interacting with the Polkadot network, make sure to set it as the active account by clicking on the "Use" button next to the account.

Note: Importing an existing Stellar account into the Polkadot-js extension will not affect the account's balance or transaction history on the Stellar network. It will only allow you to use that account to interact with the Polkadot network.
  </details>

  <details>
	<summary>Create A New Polkadot Wallet In The Exstension</summary>

Open the Polkadot-js extension in Google Chrome by clicking on the puzzle icon in the top right corner of the browser and selecting "polkadot-js".

- 1.) In the extension, click on the "Accounts" tab and then select "Add Account"
- 2.) A new window will appear, select "Create a new seed"
- 3.) Enter a name for your new wallet, this is for your reference only
- 4.) Click on the "Generate" button to create a new seed phrase.
- 5.) Carefully write down the seed phrase on a piece of paper and store it in a safe place, as it will be needed to restore access to your wallet if you ever lose your password.
- 6.) Confirm your seed phrase by typing it in the field provided and clicking the "Confirm" button.
- 7.) Once the seed phrase is confirmed, you will be prompted to create a password for the new wallet.
- 8.) Enter a strong password and click "Save"

The new wallet will appear in the "Accounts" tab, and you will be able to use it to interact with the Polkadot network, this is a great option if you already have an exsisting stellar wallet.

Note: It is important to keep your seed phrase and password safe and secure, as anyone with access to them will be able to access and control your funds.
  </details>

  <details>
	<summary>Create a New Stellar Wallet With Threefold Connect</summary>

You will want to follow this Tutorial to Setup your Threefold Connect Wallet https://forum.threefold.io/t/threefold-farming-guide-part-2/2990

2.) Once you have Create Your Wallet you will want to follow the steps above under "Use An Exsisting Stellar wallet" using the Nmeonics you generate during the previous step. 
  </details>

</details>

<details>
	<summary><b>Acquire TFT</b></summary>

In order to purchase TFT we will need to use an interface compatible with the stellar decentralized exchanges for this example we will use LOBSTR
  <details>
	<summary><b>Install LOBSTR</b></summary>

you will need to install the LOBSTR app on your mobile device 
<details>
<summary>Install LOBSTR FOR IOS</summary>

 - 1.) Open the App Store on your iOS device.
 - 2.) Search for "Lobstr" in the search bar and select the app from the results.
 - 3.) Click on the "Get" button to start the installation process.
 - 4.) Once the installation is complete, you will see a notification that the app has been added to your device.
 - 5.) Go to the home screen of your device and open the Lobstr app.


</details>

<details>
  <summary>Install LOBSTR for Android</summary>

- 1.) Open the Google Play Store on your Android device.
- 2.) Search for "Lobstr" in the search bar and select the app from the results.
- 3.) Click on the "Install" button to start the installation process.
- 4.) Once the installation is complete, you will see a notification that the app has been added to your device.
- 5.) Go to the home screen of your device and open the Lobstr app.
 
 </details>
</details>
  
<details>
 <summary><b>Import wallet into LOBSTR</b></summary>

- 1.) You will be prompted to either create a new wallet or restore an existing one, If you dont already have a stellar wallet you should create one with with Threefold Connect Using the steps under "Create a new wallet with Threefold Connect"
- 2.) Add your exisisting or Threefold Connect Wallet by selecting "Restore Wallet" and entering your seed phrase and password.
- 3.) Once you've created or restored your wallet, you will be able to view your account balance and transaction history, and create and sign transactions.
Note: Make sure you have the latest version of Android or IOS installed on your device to use this app.
</details>

<details>
	<summary><b>Fund your stellar wallet that you imported into LOBSTR</b></summary>

You will need to fund your wallet with xlm in order to trade it for TFT there are two primary ways of accomplishing this

  <details>
	<summary>Purchase XLM with with MoonPay</summary>

- Open the Lobstr app on your iOS or Android device.
- Tap on the "Buy" button in the bottom navigation bar
- Select "XLM" from the list of available currencies
- Select the amount you would like to purchase
- Tap on "Next"
- Select "Moonpay" as the Payment Method
- Fill in your payment details, such as credit card information, and confirm the transaction
- Wait for the transaction to be confirmed, it may take a few minutes for the funds to appear in your Lobstr wallet
- Once the transaction is complete, you will see the XLM credited to your Lobstr wallet.

Note: It's important to check the exchange rate and the fees associated with the purchase before completing the transaction. Also, you need to have an account with Moonpay to use this method to buy XLM.
  </details>

   <details>
	<summary>Transfer XLM from an Exchange of your choice</summary>

- Log in to your account on the centralized exchange where you purchased XLM
- Locate the option to withdraw or transfer XLM from the exchange to an external wallet
- Enter the public address of your Lobstr wallet as the destination address for the transfer.
- Be sure to double-check the destination address to ensure it is correct, as sending XLM to the wrong address may result in loss of funds
- Input the amount of XLM you wish to transfer and initiate the transaction
- Wait for the transaction to be confirmed on the blockchain, it may take a few minutes to several hours depending on the blockchain's congestion.
- Once the transaction is confirmed, you will see the XLM credited to your Lobstr wallet.

Note: Make sure you have enough XLM in your exchange account to cover the network fee for the transfer, and also check for the exchange's withdrawal limits and fees.
  </details>
</details>

<details>
	<summary><b>Swap XLM for TFT in the LOBSTR app</b></summary>
	Open the Lobstr app on your iOS or Android device.

-Tap on the "Swap" button in the bottom navigation bar.

-Select "XLM" as the currency you want to swap from.

-Select "TFT" as the currency you want to swap to.

-Input the amount of XLM you wish to swap.

-Tap on "Next"

-Review the details of the swap, such as the exchange rate, and the total amount of TFT you will receive.

-Tap on "Confirm" to initiate the swap.

-Wait for the transaction to be confirmed on the blockchain, it may take a few minutes to several hours depending on the blockchain's congestion.

-Once the transaction is confirmed, you will see the TFT credited to your Lobstr wallet.

Note: Swap feature may not be available in all regions or jurisdictions, and also make sure to check the exchange rate and the fees associated with the swap before initiating the transaction.
</details>
</details>

<details>
	<summary><b>Create Your Twin</b></summary>

you will visit the [Threefold Dashboard](https://Dashboard.grid.tf) Here you will 
- Agree to the Grids Terms and Conditions 
- Create your Digital Twin, this is your identity on the grid and represents you as deployer. 
- Once you have Accepted the Terms and Agreements and created your twin you can proceed to create your profile on the Playground
</details>

<details>
    <summary><b>Fund your Twin</b></summary>

go to "swap" on the [Dashboard](https://dashboard.grid.tf) and retrieve the Wallet address and memo for depositing to your twin from any stellar wallet address. 

**be sure you use the address and memo for twin deposits**
</details>



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

# This will enable the WSL feature on your Windows machine.
```
- Restart your computer to complete the installation of the WSL feature.
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

Once we have Installed WSL we are going to install Terraform in WSL

To install Terraform in WSL using apt, follow these steps:

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

 
# Steps To Deploy Your Workload 

If you are working in Linux these steps will be performed in the Terminal, in Windows we will be performing these tasks in WSL 

<details>
    <summary><b>Create a Directory to Store Your Terraform Deployments</b></summary>

Create a new directory where you want to store your Terraform deployments. This directory can be named anything you like. In this tutorial, we will create a deployments directory in this step and your deployment directory in the next. 

```
mkdir deployments
```
</details>

<details>
    <summary><b>Create a Directory to Store Your Umbrel Deployment</b></summary>

Create a new directory where you want to store your Umbrel Deployment. This directory can be named anything you like. In this tutorial, we will create a deployments directory and a testdeployment subdirectory inside of it.

```
mkdir deployments/umbrel
```
</details>

<details>
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
    <summary><b> Create Your Main.Tf </b></Summary>

you will create a "main.tf" file in your umbrel deployment directory, This file is the "recipe" for the how the grid will create your VM. I have provided an example below, in order to use it we will use nano to copy the contents into a new file in the umbrel deployment directory

```
nano /deployments/umbrel/main.tf

# Paste to contents of your main.tf into the window and press Ctrl+X to save and Y to Confirm
```
&nbsp;

  <details>
    <summary> The "Example" Umbrel Main.tf </summary>

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
    <summary><b>Deploy Your Main.tf</summary>
&nbsp;
  <details>
    <summary> Initialize The Deployment Directory </summary>

In order to prepare the Umbrel Deployment directory once we have inserted the main.tf, we will switch to the directory 

```
cd /deployments/umbrel
```

we will then tell Terraform to initialized the directory 
```
terraform init
```
  </details>
  <details>
    <summary> Apply Your Main.tf </summary>


```
terraform apply -parallelism=1 -auto-approve -var-file="/deployments/production.tfvars"
```

Note: You can create multiple .tfvars files and use them to save different configurations. For example, you might create a env2.tfvars file with different values for the variables. To use this file, you would pass the path to it as the `-var-file ption when running terraform apply.

Wait for the terraform apply command to complete. This may take a few minutes. When it's finished, The VM we will be installing umbrel on will be created on the Threefold Grid.
  </details>
</details>


# Steps to Connect to your Deployment 

Now we will need to connect to our deployed workload, for this tutorial we will be making our connection through Wiregaurd that we installed earlier

<details>
    <summary><b> Connect to the Wiregaurd Network</b></Summary>

&nbsp;

<details>
    <summary><b> Retrieve Wiregaurd Configuration from Terraform </b></Summary>

&nbsp;

This information is printed in the console after you run the "terraform apply" command, If you have lost the window navigate to your umbrel deployment directory 
```
cd /deployments/umbrel
```
then run the "terraform output" command 
```
terraform output
```

you will see a block of data that looks like this 

```
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
    <summary><b> Connect to your VM via SSH</b></summary>

&nbsp;

<details>
    <summary>SSH VM From Windows using Putty</summary>


https://youtu.be/NEXuWCggFB8


if you’re running Windows, you might want to use Putty to connect to your Grid VMs. This is possible, but you will need to make sure the ssh key you created your playground profile with is save in the right format. Here’s a quick step by step:


<details>
	<summary><b>Format your SSH Key For Putty Using PuttyGen</b></summary>

First run PuttyGen. Even if you already have a key you want to use, this is the best way to get the public key in the proper format. If you don’t already have a key, choose RSA and hit generate. When you’re done, hit Save private key and write the .ppk file to disk. We’ll use this file in the next step to connect.

If you already had a key or want to return to this step later, hit the Load button and select the ppk file. At the top of the PuttyGen window, you’ll see a field with the public key:

![image](https://user-images.githubusercontent.com/44621168/214651082-2b45b153-2a9b-4026-a627-1dacee5fcb77.png)

Copy the public key from this window, making sure you get everything between ssh-rsa and the key comment rsa-key... in this case. Paste that into the ssh public key field in the playground or Terraform file for your deployment. In case of the playground, also save your profile after doing this.

*Copying and pasting the public key from your ppk file will not work. There are line breaks in the file that get interpreted as extra information when they get passed to the VM. You might have success removing the line breaks manually, but copying the public key from this gui window is the simplest and most reliable way to make this work.*
</details>

Once you have your SSH key Sorted, You will be ready to

<details>
	<summary><b>Connect with Putty</b></summary>

After you’ve added the key to your playground profile or Terraform file, create your deployment. There’s no way to change the SSH key in an existing deployment, you must delete and redeploy. Copy the IP address once the deployment is successful and then open Putty.

In Putty’s config screen, navigate to Connection > SSH > Auth:

![image](https://user-images.githubusercontent.com/44621168/214651140-7dd0999b-44cb-40fd-9c00-034aa550d8af.png)

Hit Browse… and select your ppk file. Then go to Session at the top of the left nav bar and enter your VMs IP address in the Host Name (or IP address) field. Then hit the Open button at the bottom of the window to start your session. When you are prompted for a user name, enter root and you should then get access to a terminal with no password prompt.

If you’re prompted for a password, something went wrong and you won’t be able to log in. Go back and check the steps above, then feel free to post questions or problems in this thread.
  </details>
</details>




<details>
    <summary>SSH VM From Windows Using WSL</summary>

https://www.youtube.com/watch?v=uiRYEaIviGI

The windows subsystem for Linux also supports SSH connections to grid deployed workloads, there is a little more setup involved than Putty. 

<details>
    <summary><b>Generate SSH key and Import to WSL</b></summary>

  <details>
    <summary>Generate and import key files Using SSH-KEYGEN and SSH-COPY-ID</summary>

- Open the Windows Command Prompt or PowerShell and run the command ssh-keygen. This will generate a new SSH key pair on your Windows machine.
- Run the command ssh-copy-id <username>@<wsl-ip-address> to copy your public key to the WSL instance. Replace <username> with your username on the WSL instance and <wsl-ip-address> with the IP address of the WSL instance.
- Open the WSL instance and navigate to the ~/.ssh directory. You should see a file called authorized_keys, which contains the public key that you just copied over.
- Open the file ~/.ssh/config and add the following:
  </details>

  <details>
      <summary>Generate and import Key Files Manually (Video Method)</summary>
       
1.) Open the Windows Command Prompt or PowerShell and run the command ssh-keygen. This will generate a new SSH key pair on your Windows machine.

```
ssh-keygen
```

2.) Open your Installed WSL and switch to the root accound 

```
su root
```

3.) Vavigate to the directory your ssh key files are saved in typically /mnt/c/users/youruser/.ssh

```
cd /mnt/c/users/parkers/.ssh
```

4.) Create a directory for your SSH KEYS 

```
mkdir /home/parker/.ssh

# (/home/user/.ssh) if you want to use the key without being root 

# (/root/.ssh) if yo want the keys to only be accesible by the wsl root account. 

```

5.) Copy your key files to the appropriate directory, typically /home/youruser/.ssh

```
cp /mnt/c/users/parkers/.ssh/id_rsa.pub /home/youruser/.ssh/id_rsa.pub
cp /mnt/c/users/parkers/.ssh/id_rsa /home/youruser/.ssh/id_rsa
```

6.) Properly own the key files in WSL 

```
chown parker:parker /home/youruser/.ssh/id_rsa.pub
chown parker:parker /home/youruser/.ssh/id_rsa
```

7.) Protect your keys 

```
# Set the .ssh directory and public key to 644 

chmod 644 /home/user/.ssh
chmod 644 /home/user/.ssh/id_rsa.pub


# Set your Private Key so that only you can read it by making it 600

chmod 600 /home/user/.ssh/id_rsa.pub
```
  </details>
</details>

<details>
    <summary>Connect to your VM using WSL</summary>

Once you generated your keys and imported them into WSL you will be ready to connect to your VM

  <details>
    <summary>Connect using a public IPV4/IPV6</summary>

to connect you will type SSH follow by root@yourvmsipv4 or root@[yourvmsipv6]

```
ssh root@162.205.204.230
ssh root@[2a02:16a8:dc:501:74d4:eeff:fe1b:64c5]
```

  </details>

  <details>
    <summary>Connect to your VM using the Planetary Network</summary>

Windows subsystem for linux is not compatible with any current version on the planetary network connector you will need to do some extra setup to use the planetary network with WSL 

- You can find Documentation on how to connect install yggdrasil and connect to the planetary network in WSL 2 here https://forum.threefold.io/t/howto-connect-to-planetary-network-on-wsl2/3511
- Once you are connected to the network you will connect to the planetary address like any other ipv6 address with ssh root@[planetarynetworkaddress]
```
ssh root@[300:d969:30ff:c0a0:e4d4:88ba:ecdd:2b70]
```
**Tip** if your having trouble telling which ip is your planetary address, they always start with 200 or 300 IE. <b>300</b>:d969:30ff:c0a0:e4d4:88ba:ecdd:2b70

  </details>
</details>
</details>

<details>
    <summary> SSH VM from Linux </summary>

Linux is natively compatible with the grid and can ssh workloads from the terminal with no additional software, once your are connected to the wiregaurd network just open a terminal and run 

```
ssh root@your.vms.wiregaurd.ip
```

</details>
</details>

# Steps To Install Umbrel on Your Deployment 




    

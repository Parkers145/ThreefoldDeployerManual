**The End Result of This Tutorial**


***Umbrel Demostration Video*** 


During one of the recent Comuunity Q&A and Tech Calls, one of our community members brought up installing [Umbrel](https://umbrel.com/) on Threefold Grid  

For this tutorial we will be using  
- Full VM deployment with 4 cores, 8000 mb of ram and 900 gb of storage
- Ubuntu 22.04 image
- Terraform 
- Wiregaurd 
- Umbrel  
- Putty / SSH client of your choice. 

# Steps to setup your Grid Accounts



# Steps to Prepare Your Local Machine 

<details>
    <summary><b> Windows Local Machine Preparations </b></summary>

  <details>
      <summary><b>Windows - Install WSL 2 and Ubuntu 22.04 in windows</b></summary>

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

To install Terraform on Windows, follow these steps:

- Go to the Terraform downloads page (https://www.terraform.io/downloads.html).
- Select the "Windows 64-bit" package and download it to your system.
- Double-click the downloaded .exe file to start the installation process.
- Follow the prompts to install Terraform.
- Once the installation is complete, open a command prompt window.
- Type terraform and press Enter to verify that the installation was successful. You should see the Terraform usage information displayed.
- Now you are ready to use Terraform to deploy the main.tf configuration file. Follow the steps in the previous tutorial to deploy the configuration.
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

Now you are ready to use Terraform to deploy the main.tf configuration file. Follow the steps in the previous tutorial to deploy the configuration.
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




# Steps to Install Umbrel on Your Deployment 


<details>
    <summary><b>Update and Upgrade Your VM</b></summary> 

After Connecting to your VM via SSH, run these commands in your terminal for Ubuntu 22.04 
```
apt update && apt upgrade -y 
```

If you encouter an error about a grub update on a pink screen, simply press yes and proceed, this is a incompatability between that update and the hypervisor firmware, it will not affect peformance, but this error can be avoided by running this command prior to updating 
```
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
    <summary><b>Restart Your VM</b></summary> 

```
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


# <Center> Acessing your Ubuntu VM Deployed on the Threefold Grid </Center>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Once you have deployed your Ubuntu vm its time to put it to work, when your workload deploys successfully you will be presented with a status read out that reports the Ip addresses that your workload has deployed with,

 If you have deployed with only a planetary network address you will need to install the [Planetary Network Connector](https://github.com/threefoldtech/planetary_network) and have it connected prior to connecting to your workload. Connecting to any workload using the planetary network has the added benefit of connecting you over an encrypted ipv6 tunnel. if you need that. 
 
# Windows 

On windows you have to very simple options for connecting to your workload, Putty and WSL. 

# Connecting to Grid VMs from Widows Using Putty 

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



# Connecting to A Grid VM From Windows Using WSL

https://www.youtube.com/watch?v=uiRYEaIviGI

The windows subsystem for Linux also supports SSH connections to grid deployed workloads, there is a little more setup involved than Putty. 
<details>
    <summary><b>Install WSL 2 and Ubuntu 22.04 in windows</b></summary>

- Make sure you have Windows 10 version 2004 or higher installed. You can check your version by going to Settings > System > About.
- Open the Windows PowerShell as an administrator and run the command 
```
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart. 

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
    <summary><b>Connect to your VM using WSL</b></summary>

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



  
# Connecting to A Deployed VM From Linux 
  
  Linux is natively compatible with the grid and can ssh workloads from the terminal with no additional software when using public ipv4/ipv6. If you workload has been deployed using only a planetary network address, you will need to install the [Planetary Network Connecter](https://github.com/threefoldtech/planetary_network) and have it connected prior to connecting to your deployed workload.

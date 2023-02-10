# Connecting to A Grid VM From Windows Using WSL

<iframe width="560" height="315" src="https://www.youtube.com/embed/uiRYEaIviGI" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

The windows subsystem for Linux also supports SSH connections to grid deployed workloads, there is a little more setup involved than Putty. 
<details>
    <summary><b>Windows - Install Windows Subsystem For Linux</b></summary>

___
Open the Windows PowerShell as an administrator  
    
First, we will install WSL 
     
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

That's it! You have successfully installed WSL 2 and Ubuntu 22.04 LTS on your Windows machine. Now you can use Ubuntu commands and install any package you like using apt command
___

</details>

<details>
    <summary><b>Generate SSH key and Import to WSL</b></summary>

    
1.) Open the Windows Command Prompt or PowerShell and run the command ssh-keygen. This will generate a new SSH key pair on your Windows machine.

```console
ssh-keygen
```

2.) Open your Installed WSL and switch to the root accound 

```console
su root
```

3.) Vavigate to the directory your ssh key files are saved in typically /mnt/c/users/youruser/.ssh

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
  
</details>

<details>
    <summary><b>Connect to your VM using WSL</b></summary>

Once you generated your keys and imported them into WSL you will be ready to connect to your VM

  <details>
    <summary>Connect using a public IPV4/IPV6</summary>

to connect you will type SSH followed by root@yourvmsipv4 or root@[yourvmsipv6]

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



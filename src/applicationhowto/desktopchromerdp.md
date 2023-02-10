# Creating a Cloud Linux Desktop environment on the Threefold Grid 


**The End Result of This Tutorial**

<iframe width="560" height="315" src="https://www.youtube.com/embed/FVy-nOcyKJQ" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>



An often requested feature is desktop environments hosted on the Threefold Grid. I have recently found a viable solution solution to this using relatively user friendly tools and this will be a tutorial on how how you can accomplish the same. 

For this tutorial we will be using a 
- Full VM deployment with 4 cores, 4096 mb of ram and 50 gb of storage
- Ubuntu 22.04 image
- Chrome Remote Desktop 
- Putty / SSH client of your choice. 

# Steps to Complete the Project 


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

<iframe width="560" height="315" src="https://www.youtube.com/embed/FVy-nOcyKJQ?start=119" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>

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

<iframe width="560" height="315" src="https://www.youtube.com/embed/FVy-nOcyKJQ?start=236" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
   
   </details>

   <details>
            <summary>Jump to Restart Your VM Expected Behavior Section</summary>

Console Input 


Command Success 


   </details>
</details>

<details>
    <summary><b>Install the Desktop Enviroment</b></summary> 

Once you have update your VM you will want to run this command, this is a large download and the install takes awhile 
```
apt install ubuntu-desktop
```
# Download Chrome Remote Desktop
```
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
```
# Install Chrome Remote Desktop 
```
apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
```
# Set Desktop environment display manager for chrome 
```
bash -c echo “exec /etc/X11/Xsession /usr/bin/gnome-session” > /etc/chrome-remote-desktop-session’
```
# Create a new user 
```
adduser parker 
```
# make user a sudoer 
```
usermod -aG sudo parker
```
# restart your VM 
```
reboot -f
```

# run command from chrome web browser under add by ssh  

Go to https://remotedesktop.google.com/ and login/create account as necessary

then select setup via ssh 
![1](https://user-images.githubusercontent.com/44621168/214385290-25d4a8e2-c636-4eca-a651-8e32fcd7fe4d.png)



follow the prompts begin->

![2](https://user-images.githubusercontent.com/44621168/214385298-08389aa1-fd4f-425b-971b-c384be00e187.png)

next->
![3](https://user-images.githubusercontent.com/44621168/214385315-5aa7be91-0c89-4a10-b141-17989583d4d3.png)

![3](https://user-images.githubusercontent.com/44621168/214491333-2ea38344-6beb-470a-b031-3d5098c2145a.png)

Command Success 

![4](https://user-images.githubusercontent.com/44621168/214385334-1081f255-f2ab-45d5-933c-7f85c7202c85.png)

   </details>
</details>

<details>
    <summary><b>Return to Your VM Console and Switch To Your User</b></summary> 

```
su parker
```
# Paste the key from the browser into your vms console 

   </details>
</details>

<details>
    <summary><b>Paste The Key From The Browser Into Your VMs Console</b></summary> 

you should now be able to login into your into Linux desktop by returning to the remote access tab. 
![6](https://user-images.githubusercontent.com/44621168/214385374-2652b858-f961-43e6-922f-1ad71f0cc6e3.jpeg)


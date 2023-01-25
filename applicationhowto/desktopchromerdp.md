# Creating a Cloud Linux Desktop environment on the Threefold Grid 


**Video Tutorial**


[![Video Tutorial](https://img.youtube.com/vi/FVy-nOcyKJQ/0.jpg)](https://www.youtube.com/watch?v=FVy-nOcyKJQ)


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
            <summary><b<p style="color:blue;">Jump to Update and Upgrade Your VM Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=199s

   </details>
</details>

<details>
    <summary><b>Restart Your VM</b></summary> 

```
reboot -f
```

<details>
        <summary><b><p style="color:blue;">Jump to Restart Your VM Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=236s

   </details>
</details>

<details>
    <summary><b>Install the Desktop Enviroment</b></summary> 

Once you have update your VM you will want to run this command, this is a large download and the install takes awhile 
```
apt install ubuntu-desktop
```

<details>
        <summary><b><p style="color:blue;">Jump to Install the Desktop Enviroment Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=283s

   </details>
</details>

<details>
    <summary><b>Download Chrome Remote Desktop</b></summary>

Now we will download the software package that will install the chrome remote desktop extension 
```
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
```

<details>
        <summary><b><p style="color:blue;">Jump to Download Chrome Remote Desktop Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=349s

   </details>
</details>

<details>
    <summary><b>Install Chrome Remote Desktop</b></summary> 

Now We will install the package the package we just downloaded from the directory we downloaded it to (should be where you are)
```
apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
```

<details>
        <summary><b><p style="color:blue;">Jump to Install Chrome Remote Desktop Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=362s

   </details>
</details>

<details>
    <summary><b>Set Desktop Environment Display Manager For Chrome</b></summary> 

```
bash -c echo “exec /etc/X11/Xsession /usr/bin/gnome-session” > /etc/chrome-remote-desktop-session’
```

<details>
        <summary><b><p style="color:blue;">Jump to Set Desktop Environment Display Manager For Chrome Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=390s

   </details>
</details>

<details>
    <summary><b>Create A New User</b></summary> 

```
adduser parker 
```

<details>
        <summary><b><p style="color:blue;">Jump to Create A New User Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=409s

   </details>
</details>

<details>
    <summary><b>Make User a Sudoer</b></summary>

```
usermod -aG sudo parker
```

<details>
        <summary><b><p style="color:blue;">Jump to Make User a Sudoer Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=433s

   </details>
</details>

<details>
    <summary><b>Restart Your VM</b></summary> 

```
reboot -f
```

<details>
        <summary><b><p style="color:blue;">Jump to Restart Your VM Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=236s

   </details>
</details>

<details>
    <summary><b>Get Command From Chrome Web Browser Under Add By SSH</b></summary> 

Go to https://remotedesktop.google.com/ and login/create account as necessary

then select setup via ssh 

![1](https://user-images.githubusercontent.com/44621168/214478528-ea132b2e-edc6-447f-987b-e4a656e3e708.png)

follow the prompts begin->
 
![2](https://user-images.githubusercontent.com/44621168/214478561-0ac197e2-31e2-4a7c-9cbb-87f8313d91ad.png)

next->
 
![3](https://user-images.githubusercontent.com/44621168/214478592-c1f2b02e-84af-42f3-bc0b-abbdcc9482c5.png)

authorize 

![4](https://user-images.githubusercontent.com/44621168/214478602-1a2bd4d9-ac3a-49c2-a71d-c169d28759fe.png)
 
Copy the Debian linux box 
 
![5](https://user-images.githubusercontent.com/44621168/214478615-f77d2f30-2a73-4e84-8a4f-0c814ca9b023.png)
 
<details>
        <summary><b><p style="color:blue;">Jump to Get Command From Chrome Web Browser Under Add By SSH Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=456s

   </details>
</details>
<details>
    <summary><b>Return to Your VM Console and Switch To Your User</b></summary> 

```
su parker
```

<details>
        <summary><b><p style="color:blue;">Jump to Return to Your VM Console and Switch To Your User Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=477s

   </details>
</details>

<details>
    <summary><b>Paste The Key From The Browser Into Your VMs Console</b></summary> 

you should now be able to login into your into Linux desktop by returning to the remote access tab. 

![6](https://user-images.githubusercontent.com/44621168/214478645-aa434bc0-adbf-4bca-8264-ef5dce5d43ec.jpeg)

<details>
        <summary><b><p style="color:blue;">Jump to Paste The Key From The Browser Into Your VMs Console Video Section</p></b></summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=482s
   </details>
</details>






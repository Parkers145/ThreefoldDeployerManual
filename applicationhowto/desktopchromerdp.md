# Creating a Cloud Linux Desktop environment on the Threefold Grid 


**The End Result of This Tutorial**


https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=501s


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

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=199s

   </details>

   <details>
            <summary>Jump to Update and Upgrade Your Expected Behavior Section</summary>

Console Input 
       
![image](https://user-images.githubusercontent.com/44621168/214485444-a7f20911-7c81-4e40-8fd2-8f47cea5e845.png)

Command Success 
       
![image](https://user-images.githubusercontent.com/44621168/214485463-060dec07-441a-48e8-8b03-8c6e78d3f0d0.png)


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

![rebootinput](https://user-images.githubusercontent.com/44621168/214490044-420959bd-34df-4e16-a763-7061bc32056b.png)

Command Success 

![Rebootsuccess](https://user-images.githubusercontent.com/44621168/214490053-35a396ac-67dc-4fac-87af-d34bec204ef6.png)

   </details>
</details>

<details>
    <summary><b>Install the Desktop Enviroment</b></summary> 

Once you have update your VM you will want to run this command, this is a large download and the install takes awhile 
```
apt install ubuntu-desktop
```

<details>
        <summary>Jump to Install the Desktop Enviroment Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=283s

   </details>

   <details>
            <summary>Jump to Install the Desktop Enviroment Expected Behavior Section</b></summary>

Console Input 
    
![installdesktopinput](https://user-images.githubusercontent.com/44621168/214490077-32d6a6c6-c348-4758-8375-566ba867baf3.png)


Command Success 

![installdesktopsucess](https://user-images.githubusercontent.com/44621168/214490087-3ef7748c-baed-47bc-aa4c-60b128e44151.png)

   </details>
</details>

<details>
    <summary><b>Download Chrome Remote Desktop</b></summary>

Now we will download the software package that will install the chrome remote desktop extension 
```
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb
```

<details>
        <summary>Jump to Download Chrome Remote Desktop Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=349s

   </details>

   <details>
            <summary>Jump to Download Chrome Remote Desktop Expected Behavior Section</summary>

Console Input 
       
![wgetinput](https://user-images.githubusercontent.com/44621168/214490144-d685573d-7c35-48a2-a93e-41f109515efd.png)


Command Success 

![wgetsuccess](https://user-images.githubusercontent.com/44621168/214490159-31a6037c-05fd-469e-a9a5-ae4dea6c9b9a.png)

   </details>
</details>

<details>
    <summary><b>Install Chrome Remote Desktop</b></summary> 

Now We will install the package the package we just downloaded from the directory we downloaded it to (should be where you are)
```
apt-get install --assume-yes ./chrome-remote-desktop_current_amd64.deb
```

<details>
        <summary>Jump to Install Chrome Remote Desktop Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=362s

   </details>

   <details>
            <summary>Jump to Install Chrome Remote Desktop Expected Behavior Section</summary>

Console Input 
       
![aptgetinput](https://user-images.githubusercontent.com/44621168/214490216-d49c5525-f264-49f6-b6c8-183a80ef0f1e.png)


Command Success 
       
![aptgetsucess](https://user-images.githubusercontent.com/44621168/214490225-2ebc06e1-bfa7-4b65-b564-d8a14d79c377.png)


   </details>
</details>

<details>
    <summary><b>Set Desktop Environment Display Manager For Chrome</b></summary> 

```
bash -c echo “exec /etc/X11/Xsession /usr/bin/gnome-session” > /etc/chrome-remote-desktop-session’
```

<details>
        <summary>Jump to Set Desktop Environment Display Manager For Chrome Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=390s

   </details>

   <details>
            <summary>Jump to Set Desktop Environment Display Manager For Chrome Expected Behavior Section</summary>

Console Input 

![bashinput](https://user-images.githubusercontent.com/44621168/214490290-73f271ff-d128-4601-9205-8fda3b77a0a6.png)

Command Success 
       
![bashsucess](https://user-images.githubusercontent.com/44621168/214490306-a3d79128-287d-40b0-b00c-325b76ebbe70.png)


   </details>
</details>

<details>
    <summary><b>Create A New User</b></summary> 

```
adduser parker 
```

<details>
        <summary>Jump to Create A New User Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=409s

   </details>

   <details>
            <summary>Jump to Create A New User Expected Behavior Section</summary>

Console Input 

![adduserinput](https://user-images.githubusercontent.com/44621168/214490357-3c41137e-af4a-4c1e-8bf4-5fe19a1c6e66.png)

Command Success 

![addusersucess](https://user-images.githubusercontent.com/44621168/214490365-6fc0838f-3dca-4226-bb2b-0a708520cedb.png)

   </details>
</details>

<details>
    <summary><b>Make User a Sudoer</b></summary>

```
usermod -aG sudo parker
```

<details>
        <summary>Jump to Make User a Sudoer Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=433s

   </details>

   <details>
            <summary>Jump to Make User a Sudoer Expected Behavior Section</summary>

Console Input 

![sudoinput](https://user-images.githubusercontent.com/44621168/214490419-6fe7f105-095d-420d-b000-6ce45bb8c61b.png)

Command Success 

![sudosucess](https://user-images.githubusercontent.com/44621168/214490456-31a6cb19-ccbe-42a4-b739-face79214c6a.png)

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
       
![rebootinput](https://user-images.githubusercontent.com/44621168/214490485-a88e8e3a-a326-4eb9-9196-6f020a1094fb.png)


Command Success 
       
![Rebootsuccess](https://user-images.githubusercontent.com/44621168/214490502-d74883ed-a0e7-4d78-8f5b-abbac7668eb3.png)


   </details>
</details>

<details>
    <summary><b>Get Command From Chrome Web Browser Under Add By SSH</b></summary> 

Go to https://remotedesktop.google.com/ and login/create account as necessary

then select setup via ssh 
    
![1](https://user-images.githubusercontent.com/44621168/214491282-49fbd749-cf65-47cb-b13e-a7e97b1d5902.png)

follow the prompts begin->
    
![2](https://user-images.githubusercontent.com/44621168/214491304-ca348ffd-1d56-4864-9ac0-69a5125edf31.png)

next->

![3](https://user-images.githubusercontent.com/44621168/214491333-2ea38344-6beb-470a-b031-3d5098c2145a.png)

authorize 

![4](https://user-images.githubusercontent.com/44621168/214491353-1e23f458-89f4-4474-a707-4a3b27c9165a.png)

Copy the Debian\linux box 
    
![getcommand](https://user-images.githubusercontent.com/44621168/214491436-e4d1705a-b523-4479-8f6e-600de1ec37e2.png)

<details>
        <summary>Jump to Get Command From Chrome Web Browser Under Add By SSH Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=456s

   </details>

   <details>
            <summary>Jump to Get Command From Chrome Web Browser Under Add By SSH Expected Behavior Section</summary>


![getcommand](https://user-images.githubusercontent.com/44621168/214490764-ddeaef37-953c-40fd-afaa-0565ce127d97.png)


   </details>
</details>

<details>
    <summary><b>Return to Your VM Console and Switch To Your User</b></summary> 

```
su parker
```

<details>
        <summary>Jump to Return to Your VM Console and Switch To Your User Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=477s

   </details>

   <details>
            <summary>Jump to Return to Your VM Console and Switch To Your User Expected Behavior Section</summary>

Console Input 
       
![suinput](https://user-images.githubusercontent.com/44621168/214490800-69dc032b-d367-4f71-a4c2-22f1b40cbab0.png)


Command Success 
       
![susucess](https://user-images.githubusercontent.com/44621168/214490808-be74c5ec-12df-463f-9706-14772414b563.png)


   </details>
</details>

<details>
    <summary><b>Paste The Key From The Browser Into Your VMs Console</b></summary> 

you should now be able to login into your into Linux desktop by returning to the remote access tab. 


<details>
        <summary>Jump to Paste The Key From The Browser Into Your VMs Console Video Section</summary>

https://www.youtube.com/watch?v=FVy-nOcyKJQ&t=482s
   </details>

   <details>
            <summary>Jump to Paste The Key From The Browser Into Your VMs Console Expected Behavior Section</summary>

Console Input 
       
![pasteinput](https://user-images.githubusercontent.com/44621168/214490829-f9a2eca7-59a8-4592-8ab6-377e0721eb82.png)


Command Success 
       
![pastesucess](https://user-images.githubusercontent.com/44621168/214490839-ab46e886-e711-4f51-b2a8-ed63cb38929d.png)


   </details>
</details>


# Creating a Cloud Linux Desktop environment on the Threefold Grid 


**Video Tutorial**
[![Video Tutorial](https://img.youtube.com/vi/FVy-nOcyKJQ/0.jpg)](https://www.youtube.com/watch?v=FVy-nOcyKJQ)


An often requested feature is desktop environments hosted on the Threefold Grid. I have recently found a viable solution solution to this using relatively user friendly tools and this will be a tutorial on how how you can accomplish the same. 

For this tutorial we will be using a 
- Full VM deployment with 4 cores, 4096 mb of ram and 50 gb of storage
- Ubuntu 22.04 image
- Chrome Remote Desktop 
- Putty / SSH client of your choice. 

# Update and upgrade your vm 
```
apt update && apt upgrade -y 
```
# Install the Desktop Enviroment 
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


authorize 

![4](https://user-images.githubusercontent.com/44621168/214385334-1081f255-f2ab-45d5-933c-7f85c7202c85.png)

Copy the Debian linux box 
 ![5](https://user-images.githubusercontent.com/44621168/214385340-74a7ca33-5fc4-44a6-b91e-e3dae826c26a.png)


# Return to your vm console and switch to your user 
```
su parker
```
# Paste the key from the browser into your vms console 



you should now be able to login into your into Linux desktop by returning to the remote access tab. 
![6](https://user-images.githubusercontent.com/44621168/214385374-2652b858-f961-43e6-922f-1ad71f0cc6e3.jpeg)


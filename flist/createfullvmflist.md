&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;This tutorial will guide you through the process of creating a custom Full VM Flist using Linux. A Flist image is a pre-configured virtual machine that can be easily deployed on the Grid. By creating a custom image, you can add your own software and settings to the image, making it easier to set up and configure new instances on the cloud.

Before we begin, there are a few things you will need:

- A hypervisor (such as KVM or Virtualbox)
- Two tools called virt-customize and qemu-img, which you will need to install on your computer.
	```
	apt install libguestfs-tools qemu-utils
	```
- Some basic knowledge of Linux

**Step 1: Download the Cloud Image You Want To Use** 

To start, you will need to download a cloud image of your choice. In this example, we will use Ubuntu 20.04. You can download the image by visiting this [link:](https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img)

or with 

```
wget https://cloud-images.ubuntu.com/focal/current/focal-server-cloudimg-amd64.img
```

**Step 2: Resize the partition of the image**

The standard Ubuntu cloud image is 2.1GB in size. If you need more space for the software you will add later, you can use a tool called "qemu-img" to resize the partition of the image. To do this, open the command prompt and type the following command: 
```
qemu-img resize focal-server-cloudimg-amd64.img +1G
```
-  This will add 1GB to the image.


**Step 3: Set a root password**

We need to set a root password so we can login to the VM console to set up our image. To do this, open the command prompt and type the following command: "virt-customize -a ubuntu-20-04-amd64.img --root-password password:yourpassword" (replace "yourpassword" with the password of your choice)

**Step 4: Expand the file system on the cloud image**

Next, we need to expand the file system on the cloud image. To do this, you will need to use a temporary VM and attach an Ubuntu desktop ISO and the cloud image to it. Boot into Ubuntu desktop and start GParted. It will ask if GPT can use the free space, press ‘Fix’.
Select the cloud image (the ext4 partition), right-click it and choose ‘Resize/Move’. Move the used ‘partition space bar’ to the right to expand the file system. Then press ‘Resize/Move’, next the green check mark to apply the changes, confirm with ‘Apply’. This will expand the partition and you can shut down the VM again.

**Step 5: Install your custom software**

To start the temporary VM for customizing the cloud image using the QEMU hypervisor, you will need to use the command line. The process is as follows:

- 1.) Open the command prompt or terminal on your computer.

- 2.) Navigate to the location of the cloud image you downloaded earlier using the "cd" command.

- 3.) Start and modify your image
	```
	qemu-system-x86_64 -enable-kvm -m 2048 -hda your_image.img to start the virtual machine.
	```
	you can use this command to start the virtual machine.
	- -enable-kvm will enable hardware acceleration, -m 2048 will assign 2048MB of memory to the virtual machine, 
	- -hda your_image.img will specify the path to the cloud image you want to use.


	```
	qemu-monitor-command --hmp 'info block' 
	```
	Once the virtual machine is running, you can use this command to check if the image is running.


	```
	qemu-system-x86_64 -enable-kvm -m 2048 -hda your_image.img -monitor stdio"
	```
	To access the virtual machine console, you can use this  command 

**Step 6: Cleanup**

Once everything has been set up to your liking and before shutting down the vm, it's important to do some cleanup to ensure the image is secure and ready for deployment. The following are the steps you need to take via the VM console:

- **2.) Remove ssh key files:**

	It's important to remove the ssh key files that were generated when enabling SSH, as they can be used to access the image remotely. You can remove these files by running the command:
	```
	rm /etc/ssh/ssh_host_*
	```
	This command will remove all files that start with "ssh_host_" in the /etc/ssh/ directory.

- **3.) Remove the directory /run/sshd:**

	The directory /run/sshd is used by the SSH daemon and it's important to remove it as well. You can remove this directory by running the command:
	```
	rm -r /run/sshd
	```

- **4.) Enable all required systemd services:**

	This step is important to ensure that your custom software or service will start automatically when the image boots. You can enable a systemd service by running the command:
	```
	systemctl enable your-service
	(replace "your-service" with the service name)
	```

- **5.) Check and enable the firewall:**

	It's important to check and enable the firewall to ensure the image is secure when it's deployed. You can check the firewall status by running the command:
	```
	ufw status
	```

	If the firewall is not enabled, you can enable it by running the command:

	```
	ufw enable
	```

- **6.) Change root password:**

	It's important to clear the root password to ensure the image is secure when it's deployed. You can clear the root password by running the command:
	```
	passwd -d "your User"
	```

- **7.) Clear bash history:**

	To ensure that your commands and configurations are not visible to others, it's important to clear the bash history for root and other users. You can clear the bash history for root

	by running the command:

	```
	echo "" > /root/.bash_history
	```
	This command will overwrite the .bash_history file with an empty string, effectively clearing it.

	If you have created other users on the VM, you will also need to clear their bash history by running the command:

	```
	echo "" > /home/username/.bash_history
	(replace "username" with the actual username)
	```

	It's also a good idea to logout of the VM console, log back in, and use a text editor such as Vim or Nano to edit the .bash_history file and put a space in front of the text editor command (so it’s not stored in the bash history when you logout). This can be done by running the command :

	```
	space + text editor command (ex: vim /root/.bash_history)
	```

	Once you have completed all the cleanup steps, you can shut down the VM and use the cloud image for deployment. Keep in mind that the image can be reused multiple times, and it's important to keep the image up-to-date and maintain the security of the image.

**Step 7: Upload image to the Hub**

Once you have completed customizing the cloud image and have done the necessary cleanup, the next step is to package and upload the image to the Hub. The Hub is a centralized repository where you can store and share your custom images.

- **1.) Convert the image format:**

	You will need to convert the image format from qcow2 to raw using the command 
	```
	qemu-img convert -p -f qcow2 -O raw your_image.img image.raw"
	```

	This command will convert the image format and save the output as "image.raw", you must use this name for a full vm. 

- **2.) Create a tarball of the image:**

	Create a tarball of the image by running the command 
	```
	tar -czf name_of_release.tar.gz image.raw
	```
	This command will create a compressed archive file "name_of_release.tar.gz" of the image.raw file. you can name your image here this file name is not important.

- **3.) Upload the image to the Hub:**

	Once you have the tarball, you can upload it to the Hub by going to https://hub.grid.tf/ and use the upload feature. Once the upload is complete, you will be able to find the uploaded image in your personal repository https://hub.grid.tf/your-username.3bot

	It's worth noting that you should keep the image updated and maintain the security of the image to ensure that it's safe to use.

	Also, depending on the size of the image, the upload may take some time, so it's best to be patient and wait for the upload to complete.

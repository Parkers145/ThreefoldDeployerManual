# Setting up SMTP Services on the Threefold Grid 

  

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; There are two options for deploying SMTP on the on the grid a full smtp server or a smtp relay server both of these will be deployed using the Ubuntu 20.04 image deployable on the [Playground](https://Play.grid.tf) . I have prepared documentation on doing this. read all of this post before you deploy any resources, you've been warned its not fun deleting half your deployments that were done before you read a requirement.  

  

you can checkout my example deployment at [Mail.ThreeFoldCloud.com](https://mail.threefoldcloud.com) 

  

For this you will want to deploy the 20.04 image with appropriate resources for the size of the server you intend to host,  

- you can find a break down of what cpu and ram needs are expected for a full smtp server [here](https://docs.iredmail.org/iredmail-easy.getting.start.html#:~:text=iRedMail%20requires%20at%20least%204,to%20support%20500%20ActiveSync%20clients.)
you can find a break down of what cpu and ram needs are expected for a smtp relay server [here](https://askubuntu.com/questions/279408/mail-server-system-requirements)

- This should be deployed with both public ipv4 & public ipv6, planetary is optional but usable for encrypted communication to the server.  

  
you need to configure the DNS records for your mail server deployment before you install your mail client on the server and follow the tutorial as they have to be properly configured to acquire your ssl certs. you will need A, AAAA, NS, and C Name records for your site. I use Go daddy for my records they should be configured the same way a threefold gateway address is configured, i cover that in this [video](https://www.youtube.com/watch?v=axvKipK7MQM&ab_channel=DrewSmith), 

how they relate to the deployments  

- A: Public ipv4  

- AAAA: Public ipv6 

- ns: _acme-Chanllenge.mail.threefoldcloud.com -> mail.threefoldcloud.com 

- C_name: *.mail.threefoldcloud.com -> mail.threefoldcloud.com 

- mx: Mail.threefoldcloud.com 

- TXT: "v=spf1 ip4:185.206.122.163 ip6:2a10:b600:1:0:94a1:d5ff:fe9d:3632 include:threefoldcloud.com -all " where you have replaced the ips and domains with your ips and domains. these will be the Ip addresses from your deployment hosting iredmail.

  

.
  Once you have your have your Ubuntu 20.04 booted you will want to run  

   

           apt update -y 

		   apt upgrade -y 
		   

		    

There is currently an incompatible ubuntu update, that may or may not be resolved by the time you do this, if you experience a warning about a failed grub installation tell it not to retry, and to continue without installing grub and the issue will not return in further updates. this is documented [here](https://github.com/threefoldtech/test_feedback/issues/319), this issue is resolved by not skipping the step of running update & upgrade and handling the warning at the beginning of each deployment. it will break the install scripts in the tutorials if you do not update and upgrade first.  

  

once you have a fully updated vm, restart your vm with  

  

             shutdown -r now 

			  

- you can host a smtp relay server on the grid by following this [tutorial](https://www.linuxbabe.com/mail-server/postfix-smtp-relay-ubuntu-sendinblue) 

  

- you can host a full fledged smtp server on the grid by  following this [tutorial](https://www.linuxbabe.com/mail-server/ubuntu-20-04-iredmail-server-installation), due to some isps blocking port 25, and the needed reliability I suggest running your smtp server on a reliable gateway farm like those of the Foundation, Greenedge and Dany Sing. these can often be identified by their gateway domain addresses on the [Threefold Grid Explorer](https://dashboard.grid.tf/explorer/nodes) 

 

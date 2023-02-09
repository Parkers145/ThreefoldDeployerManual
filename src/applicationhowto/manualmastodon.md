# Deploy Mastodon On the Threefold Decentralized Grid



&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;It is my recommendation that you setup your server using the Ubuntu 20.04 image deployable on the [Playground](https://Play.grid.tf) I have prepared documentation on doing this. read all of this post before you deploy any resources, you've been warned its not fun deleting half your deployments that were done before you read a requirement.  

  

you can checkout my example deployment at [Social.ThreeFoldCloud.com](https://social.threefoldcloud.com) 

  

For Mastadon you will want to deploy the 20.04 image with appropriate resources for the size of the server you intend to host,  

- you can find a break down of what cpu and ram needs are expected [here](https://github.com/McKael/mastodon-documentation/blob/master/Running-Mastodon/Resources-needed.md), for this tutorial you will be running without docker.  

- This should be deployed with both public ipv4 & public ipv6, planetary is optional but usable for encrypted communication to the server.  

  

Your mastodon server will require access to a smtp server there is a couple options for this, any way you accomplish this is acceptable but it is possible to host these resources on the grid.  

  

- you can host a smtp relay server on the grid by deploying the 20.04 image and following this [tutorial](https://www.linuxbabe.com/mail-server/postfix-smtp-relay-ubuntu-sendinblue) 

  

- you can host a full fledged smtp server on the grid by deploying the 20.04 cloud image and following this [tutorial](https://www.linuxbabe.com/mail-server/ubuntu-20-04-iredmail-server-installation), due to some isps blocking port 25, and the needed reliability I suggest running your smtp server on a reliable gateway farm like those of the foundation, greenedge and dany sing. these can often be identified by their gateway domain addresses on the [Threefold Grid Explorer](https://dashboard.grid.tf/explorer/nodes) 

  - [Mail.ThreeFoldCloud.com](https://mail.threefoldcloud.com), is a example of this.  

  

you need to configure the DNS records for your mastadon deployment before you install mastadon on the server and follow the tutorial as they have to be properly configured to acquire your ssl certs. you will need A, AAAA, NS, and C Name records for your site. I use Go daddy for my records they should be configured the same way a threefold gateway address is configured, i cover that in this [video](https://www.youtube.com/watch?v=axvKipK7MQM&ab_channel=DrewSmith), these are the records for my deployment, 

  

  
and how they relate to the deployments  

- A: Public ipv4  

- AAAA: Public ipv6 

- ns: _acme-Chanllenge.social.threefoldcloud.com -> social.threefoldcloud.com 

- C_name: *.social.threefoldcloud.com -> social.threefoldcloud.com 

Once you have your have your Ubuntu 20.04 booted you will want to run  

   

           apt update -y 

		   apt upgrade -y 

		    

There is currently an incompatible ubuntu update, that may or may not be resolved by the time you do this, if you experience a warning about a failed grub installation tell it not to retry, and to continue without installing grub and the issue will not return in further updates. this is documented [here](https://github.com/threefoldtech/test_feedback/issues/319), this issue is resolved by not skipping the step of running update & upgrade and handling the warning at the beginning of each deployment. it will break the install scripts in the tutorials if you do not update and upgrade first.  

  

once you have a fully updated vm, restart your vm with  

  

             shutdown -r now 

			  

You will now be able to follow the [install Mastadon from source guide](https://docs.joinmastodon.org/admin/install/) 



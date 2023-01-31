# Setting Up an Ubuntu VM On the Threefold Playground </Center>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The [Ubuntu](https://ubuntu.com) images are the most versatile deployments and allow you to take advantage of the worldwide grid, while being able to utilize exsisting tools and documentation related to the [Ubuntu](https://ubuntu.com) cloud images. This can enable the grid to host any services that are hostable in a linux server, whether that be a simple website, a database or a game server. By default the Full-VM images included in the playground are, 
	
- [Ubuntu 18.04](https://releases.ubuntu.com/18.04/)
- [Ubuntu 20.04](https://releases.ubuntu.com/20.04/)
- [Ubuntu 22.04](https://releases.ubuntu.com/22.04/)

these images can be deployed with no additional configuration require to have a functional VPS, In order to deploy these images you will need to have your playground deployment profile setup there are steps documenting that process in the [Setting up You Playground](setup) section. 

with a setup Deployment profile you will select Full VM in the Sidebar this will bring you to the configuration window for your VPS. There are to tabs available here and I will address them indvidually 

- **Config:** this section configures the base attributes of your deployment and includes the following sections 
  - *Name:* this will be your deployment host name. 
  - *VM Image:* Here you can select one of the default images, or provide a custom flist link to choose the image deployed. 
  - *CPU (vcores):* This is where you choose the number of threads that will be exposed to your deployment from the host node
  - *Memory:* This configures the amount of memory that will be available to your workload from the host node. 
  - *Disk Size:* This sets the size of the root disk for your deployment. 
  - *Public IPv4:* This slider enables your load deploying with a Public IPv4 address exposed to the general internet 
  - *Public IPv6:* This slider enables your load deploying with a Public IPv6 address exposed to the general internet 
  - *Planetary Network* This slider deploys your workload with a Planetary Network IP as an alternative soluton to accessing over public ipv4/ipv6. In order to connect to workloads using only planetary I.P you will need to install the [Threefold Network Connector](https://github.com/threefoldtech/planetary_network) for Desktops, Or the Threefold Connect App available for [Android](https://play.google.com/store/apps/details?id=org.jimber.threebotlogin&hl=en_US&gl=US) and [IOS](https://apps.apple.com/us/app/threefold-connect/id1459845885), for mobile clients. 
  - *Node Selection:* This is where you will choose the node that your workload deploys on your can either utilize the capacity filter or manually select a node. you can use the [Threefold Grid Explorer](https://dashboard.grid.tf/explorer/nodes) or a community IOS application called [3node-Info](https://apps.apple.com/ca/app/3node-info/id1639700546) to locate nodes near you. 
- **Disks:** This sections allows you to add additional ssd storage to your workload, you will click the blue addition symbol in the top right corner of the disks tab and be presented with two fields
  - *name:* This is the name of the disk on the grid
  - *size:* This is the size of the disk in GB, it noteworthy to mention no single disk can exceed the sized of the hosts node individual drives, if you have trouble adding large disks this may be the problem. try a smaller size, drives can be combined with LVM in the ubuntu image after deployment. 
  
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Once you have set all of your configuration parameters you only have to click deploy and wait, if you are downloading a large base image to the node, sometimes this will time out after 5 minutes, if this happens wait a short while and attempt you deployment again the image continues to download and is cached even if the deployment fails allowing you to redeploy once it is stored locally. 

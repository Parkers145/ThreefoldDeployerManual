# <center> Deploying on The Threefold Playground </center>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;With a Fully Setup Profile you now have access to deploy any of the VPS solutions available on the playground on one of thousands of nodes located across the world. The flagship deployment solution is the industry standard [Ubuntu](https://ubuntu.com) VPS Full VM. This solution provides you the ultimate flexibility to deploy your solutions on the grid’s hardware. with the recent addition of Full-VMs you can now truly say that if you can do it in Linux, you can do it on the grid. you can deploy your VPS when you need it, where you need it, and you can delete it at any time with no lasting commitment providing the ultimate environment for deployment testing and prototyping of cloud solutions. 

<details>
    <summary><b>How To Deploy An Ubuntu VM</b></summary>

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


 </details>

-  Customized Full VM Linux images can be created for the grid using the process here [Manipulating Cloud Images for the Grid](https://forum.threefold.io/t/manipulating-cloud-images-for-the-grid/3380)
	
- Docker Hub images can be converted on the [Threefold Hub](https://Hub.Grid.tf)

**Deployable Applets**

The Playground is also host to several use case specific deployments that further automate the deployment process of end-user solutions on the Threefold Grid. Many of these solutions are designed to allow everyday users to contribute to other projects that share the vision of a decentralized world. The Threefold grid is designed to support decentralization, not compete with other forms, and is intended to provide a solid hosting support infrastructure to both crypto-currencies and otherwise decentralization focused projects. Currently the grids deployment solutions include. 

<details>
     <summary>Kubernetes</summary>
	 
	[Kubernetes](https://kubernetes.io/) is a portable, extensible, open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.

</details>

<details>
     <summary>Caprover</summary>
 
 [Caprover](https://caprover.com/) is an extremely easy to use app/database deployment & web server manager for your NodeJS, Python, PHP, ASP.NET, Ruby, MySQL, MongoDB, Postgres, WordPress (and etc...) applications!
</details>

<details>
     <summary>Peertube</summary>
  - [Peertube](https://joinpeertube.org/), developed by Framasoft, is the free and decentralized alternative to video platforms, providing you over 600,000 videos published by 150,000 users and viewed over 70 million times

</details>

<details>
     <summary>Funkwhale</summary>
  - [Funkwhale](https://funkwhale.audio/) is a community-driven project that lets you listen and share music and audio within a decentralized, open network.

</details>

<details>
     <summary>Mattermost</summary>
  - [Mattermost](https://mattermost.com/), An open-source, self-hostable online chat service with file sharing, search, and integrations. It is designed as an internal chat for organisations and companies, and mostly markets itself as an open-source alternative to Slack and Microsoft Teams

</details>

<details>
     <summary>Discourse</summary>
  - [Discourse](https://www.discourse.org/), the 100% open source discussion platform built for the next decade of the Internet. Use it as a mailing list, discussion forum, long-form chat room, and more!

</details>

<details>
     <summary>Taiga</summary>
  - [Taiga](https://www.taiga.io/), The free and open-source project management tool
For cross-functional agile teams to work effectively
A featured-rich software that offers a very simple start through its intuitive user interface.

</details>

<details>
     <summary>Owncloud</summary>
  - [Owncloud](https://owncloud.com/), Control your data – always, anytime and anywhere. Deploy ownCloud on-premises, in a data center of your choice or in a hybrid setup. Regulations and certifications? Say no more. We keep your back! With multi-factor authentication, encryption and our elaborate file lifecycle management. Looking for 100% data ownership? Deploy with owncloud on Threefold 

</details>

<details>
     <summary>Presearch</summary>
  - [Presearch](https://presearch.io/), Search privately, receive better results and get rewarded with the Presearch decentralized search engine, powered by blockchain technology.

</details>

<details>
     <summary>SubSquid</summary>
  - [SubSquid](https://subsquid.io/), An on-chain data processing solution that enables Web3 builders to gain access to on-chain data on their own terms.

</details>

<details>
     <summary>CasperLabs</summary> 
  - [CasperLabs](https://casperlabs.io/), a team of builders, entrepreneurs, academics, and leaders who believe strongly in the potential of a blockchain-enabled world. We’ve come together to steward the development of the Casper Network, a blockchain protocol built from the ground up to remain true to core Web3 principles and adapt to the needs of our evolving world. Come join us and help build the future.

</details>

<details>
     <summary>Node Pilot</summary>
  - [Node Pilot](https://nodepilot.tech/), a simple Linux executable, making your deployment options endless. No command-line experience is required. Whether on VMs or bare-metal, anyone can run crypto nodes with Node Pilot. Entry-level friendly. Self-host or Cloud VPS.

</details>
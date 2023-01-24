# Your Threefold Cloud Ubuntu VM's Network Interfaces
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Deploying Ubuntu VM on the Threefold cloud follows a pretty standard procedure for any VPS, but once in your VM interacting with and configuring the network interfaces can be a bit overwhelming luckily with a little explanation of what things are and how you can use them, you will be able to follow all of the documentation for Ubuntu networking available when configuring your Threefold VPS. If you remember from our setup guide your VM has three possible interfaces Z-Net, Public IPV4/IPV6 and Planetary. When deploying on the default ubuntu images the interfaces are typically ordered 

Eth0: Z-net


Eth1: Public IP


Eth2: Planetary

But if your deployments interfaces are not in this order they are each easily identifiable by their attributes 

- Eth0: Z-net
  - Private Subnet IP Address And has a DNS server set 
- Eth1: Public IP
  - Public Subnet IPv4/IPv6 Address with no DNS server set 
- Eth2: Planetary
  - IPV6 Address with no IPV4 Address
 
 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Each interface of your deployment serves a different purpose and can be used differently. 
 
- Z-Net: Functions most similarly to how you would expect the internet connection on your home computer to work, this interface provides the VM with access to the internet for things like OS updates or downloading files, while isolating the VM from the hosts local private network. This network also includes other 3nodes and VMs and can be used to create a link between a deployed workload with a Public IP and one without or two workloads that neither of which have public Ipss regardless of the nodes physical locations. Think of Z-Net as the LAN network of the Grid. you cannot connect non grid devices to z-net. Currently VMs deployed through playground are unable to use the overlay network to contact other playground vms, in order to configure a multi node overlay, the deployment must be accomplished using terraform. 

- Public IPV4/IPV6: Deploying with this interface gives your workload its own traditional Public IPv4 or IPv6 Address and allows your workload to support workloads that will be accessed by the public or function as a router. This interface is a direct connection to the internet provided by the host of your deployments 3 nodes and the Ip belongs entirely to your virtual machine and your are able to use it to do anything your Linux VM is capable of. Public Ip addresses bill on both a reserved basis and on a per GB transferred basis, so it is advisable to transit as much traffic as possible over Z-net or the Planetary Network. You want to think of this interface as a WAN connection for the grid. Your Public Interface I.P. Address will be reachable by all internet users

- Planetary Network: This is a p2p encrypted mesh network that allows workloads without public Ip addresses to be accessed by devices that are not grid devices and cannot connect to Z-net. There is a detailed explanation of the planetary network available [Here](https://forum.threefold.io/t/how-our-planetary-network-works/1210) But the nuts and bolts of it are that you can use it so that you can access workloads without public I.P addresses by installing the [Threefold Network Connector](https://github.com/threefoldtech/planetary_network) for Mac, Linux Or Windows Or Threefold connect app available for [Android](https://play.google.com/store/apps/details?id=org.jimber.threebotlogin&hl=en_US&gl=US) and [IOS](https://apps.apple.com/us/app/threefold-connect/id1459845885). This interface will be reachable by and can reach all other planetary addresses. You’ll want to think of this as the VPN network used to access the grid from non grid devices.

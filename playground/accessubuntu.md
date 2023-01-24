# <Center> Acessing your Ubuntu VM Deployed on the Threefold Grid </Center>

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Once you have deployed your Ubuntu vm its time to put it to work, when your workload deploys successfully you will be presented with a status read out that reports the Ip addresses that your workload has deployed with,

 If you have deployed with only a planetary network address you will need to install the [Planetary Network Connector](https://github.com/threefoldtech/planetary_network) and have it connected prior to connecting to your workload. Connecting to any workload using the planetary network has the added benefit of connecting you over an encrypted ipv6 tunnel. if you need that. 
 
**Windows**

 On windows you have to very simple options for connecting to your workload, Putty and WSL. 
  - **Putty:** This is a windows based application that is compatible with connecting to grid deployments that is available at [Putty.org](https://www.putty.org/), make sure that you are using the same SSH keys with putty that you entered when creating your deployment profile. 
    - You can find a detailed guide for connecting with putty here, [Using Putty with Grid VMs](https://forum.threefold.io/t/using-putty-with-grid-vms/3390)
	- There is a video tutorial available here, [SSH your Threefold Deployment from Windows using Putty](https://www.youtube.com/watch?v=NEXuWCggFB8)
  - **WSL:** The windows subsystem for Linux also supports SSH connections to grid deployed workloads, you can install the latest version of WSL by installing [Ubuntu in the Microsoft store.](https://www.microsoft.com/store/productId/9PDXGNCFSCZV), note that must ensure you have imported the SSH key you used when setting up you deployment profile into WSL and have set the key files permissions correctly
    - There is video Tutorial here, [SSH your Threefold Deployment from Windows with WSL](https://www.youtube.com/watch?v=uiRYEaIviGI)
  
  **Linux**
  
  Linux is natively compatible with the grid and can ssh workloads from the terminal with no additional software when using public ipv4/ipv6. If you workload has been deployed using only a planetary network address, you will need to install the [Planetary Network Connecter](https://github.com/threefoldtech/planetary_network) and have it connected prior to connecting to your deployed workload.


This Tutorial was written by Community Member Flowmotion. 

Since I love WSL on Windows and as I use it for everything as also ssh-ing to all my VM's in Proxmox, it was clear for me to set up planetary network on WSL and not on a VM or on Windows.

As the default installation with [ThreefoldNetworkConnector ](https://github.com/threefoldtech/planetary_network) for Linux is made for a GUI and the default Yggdrasil installation is made as service for systemd this both options aren't a solution.
Thats because WSL has no GUI ans also no generally known systemd.

Side hint: I use Cmder on windows to use all possible shells and with saved tasks I have all my possible ssh targets saved on one location. 
The Task parameters would something be like: 
set

```console
"PATH=%ConEmuBaseDirShort%\wsl;%PATH%" & wsl.exe -d Debian sshpass -p <password> ssh root@<IP> -new_console:t:"<title>"
```

# Set up Planetary Network:
All steps are made on your wsl distro!

### First install golang 
sources: [golang](https://go.dev/dl/)
Info: Yggdrasil requires Go 1.11 as a minimum.
Following instructions are made with Debian-WSL

**Remove any previous Go installation**  by deleting the /usr/local/go folder (if it exists), then extract the archive you just downloaded into /usr/local, creating a fresh Go tree in /usr/local/go:

`$ rm -rf /usr/local/go && tar -C /usr/local -xzf go1.19.3.linux-amd64.tar.gz`

(You may need to run the command as root or through  `sudo` ). **Do not**  untar the archive into an existing /usr/local/go tree. This is known to produce broken Go installations.

Add /usr/local/go/bin to the `PATH`  environment variable.You can do this by adding the following line to your $HOME/.profile or /etc/profile (for a system-wide installation):

`export PATH=$PATH:/usr/local/go/bin`

**Note:**  Changes made to a profile file may not apply until the next time you log into your computer. To apply the changes immediately, just run the shell commands directly or execute them from the profile using a command such as  `source $HOME/.profile` .

Verify that you've installed Go by opening a command prompt and typing the following command:

`$ go version`

Confirm that the command prints the installed version of Go.

### Second install git

This step is easy ;)

`sudo apt install git`

### Third install yggdrasil
sources: [yggdrasil](https://yggdrasil-network.github.io/installation-linux-other.html)

Clone the repository and build:
```
cd /path/to
git clone https://github.com/yggdrasil-network/yggdrasil-go
```

Build Yggdrasil:
```
cd /path/to/yggdrasil-go
./build
```

The build will produce  `yggdrasil`  and  `yggdrasilctl`  binaries - copy these into a suitable location:
```
sudo cp {yggdrasil,yggdrasilctl} /usr/local/bin
```

### Fourth configure yggdrasil for our grid
Generate an initial Yggdrasil configuration file:
```
sudo yggdrasil -genconf > /etc/yggdrasil.conf
```

Paste following into the "Peers: []" array. With command `nano /etc/yggdrasil.conf` for example

      Peers: [
            #Tf Lochrist
            tcp://gent01.grid.tf:9943
            tcp://gent02.grid.tf:9943
            tcp://gent03.grid.tf:9943
            tcp://gent04.grid.tf:9943
            tcp://gent01.test.grid.tf:9943
            tcp://gent02.test.grid.tf:9943
            tcp://gent01.dev.grid.tf:9943
            tcp://gent02.dev.grid.tf:9943
            # GreenEdge
            tcp://gw291.vienna1.greenedgecloud.com:9943
            tcp://gw293.vienna1.greenedgecloud.com:9943
            tcp://gw294.vienna1.greenedgecloud.com:9943
            tcp://gw297.vienna1.greenedgecloud.com:9943
            tcp://gw298.vienna1.greenedgecloud.com:9943
            tcp://gw299.vienna2.greenedgecloud.com:9943
            tcp://gw300.vienna2.greenedgecloud.com:9943
            tcp://gw304.vienna2.greenedgecloud.com:9943
            tcp://gw306.vienna2.greenedgecloud.com:9943
            tcp://gw307.vienna2.greenedgecloud.com:9943
            tcp://gw309.vienna2.greenedgecloud.com:9943
            tcp://gw313.vienna2.greenedgecloud.com:9943
            tcp://gw324.salzburg1.greenedgecloud.com:9943
            tcp://gw326.salzburg1.greenedgecloud.com:9943
            tcp://gw327.salzburg1.greenedgecloud.com:9943
            tcp://gw328.salzburg1.greenedgecloud.com:9943
            tcp://gw330.salzburg1.greenedgecloud.com:9943
            tcp://gw331.salzburg1.greenedgecloud.com:9943
            tcp://gw333.salzburg1.greenedgecloud.com:9943
            tcp://gw422.vienna2.greenedgecloud.com:9943
            tcp://gw423.vienna2.greenedgecloud.com:9943
            tcp://gw424.vienna2.greenedgecloud.com:9943
            tcp://gw425.vienna2.greenedgecloud.com:9943
            ]

### Fifth start yggdrasil or use crontab to start it
Now you can start your connection to the planetary network as you wish. Now test it with:
`sudo yggdrasil -useconffile /etc/yggdrasil.conf`

This has a huge logoutput while it is running so I start it with `&>/dev/null &` to suppress logging:
`sudo yggdrasil -useconffile /etc/yggdrasil.conf &>/dev/null &`

show that yggdrasil is running with:
`jobs`
or with
`ps -aux`

If you want that yggdrasil starts every time the WSL distro starts use crontab and paste the command there:
type `sudo crontab -e` and follow the instructions

paste 
`@reboot sleep 30 && yggdrasil -useconffile /etc/yggdrasil.conf &>/dev/null &`
and restart wsl...

Hint: don't use sudo in the crontab file. Instead start roots crontab with `sudo crontab -e`

----
Some Links:
https://library.threefold.me/info/manual/#/manual__yggdrasil_client
https://yggdrasil-network.github.io/installation-linux-other.html
https://yggdrasil-network.github.io/configuration.html
https://library.threefold.me/info/manual/#/manual__manual3_tfservices?id=supported-planetary-network-nodes
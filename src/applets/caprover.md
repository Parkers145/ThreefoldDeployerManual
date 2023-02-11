# CapRover

<img src="img/caprover_1.png" class="thumbnail"  width="90%" height="90%">

About CapRover

CapRover is an extremely easy to use app/database deployment & web server manager for your NodeJS, Python, PHP, ASP.NET, Ruby, MySQL, MongoDB, Postgres, WordPress (and etc...) applications!

It's blazingly fast and very robust as it uses Docker, nginx, LetsEncrypt and NetData under the hood behind its simple-to-use interface.

- CLI for automation and scripting
- Web GUI for ease of access and convenience
- No lock-in! Remove CapRover and your apps keep working!
- Docker Swarm under the hood for containerization and clustering
- Nginx (fully customizable template) under the hood for load-balancing
- Let's Encrypt under the hood for free SSL (HTTPS)

Caprover is a very cool management app for containers based on Docker Swarm.

It has following benefits :

- easy to deploy apps (in seconds)
- easy to create new apps
- super good monitoring
- can be extended over the TFGrid

## Requirements

- you need an account on TF-Chain, and there needs to be TFT on the account (see getting started)

<details><summary>How to Deploy
</summary>

- Choose one of the networks:
  -  https://play.dev.grid.tf for Devnet.
  -  https://play.qa.grid.tf for QAnet.
  -  https://play.test.grid.tf for Testnet.
  -  https://play.grid.tf for Mainnet.

- Login to your profile and select caprover in left side nav menu

<div class="div-img">
<img src="img/new_cap1.png" class="thumbnail"  width="60%" height="60%">
<div>

- When Choosing your domain, keep in mind that you need to have control of the entire domain so that you can use wildcard records. 

</details>

<details><summary>Deploying a leader node
</summary>

<div class="div-img">
<img src="img/caprover_deploy_leader.png" class="thumbnail"  width="60%" height="60%">
<div>

- Select a capacity package:
  - **Minimum**: {cpu: 1, memory: 1024, diskSize: 50 }
  - **Standard**: {cpu: 2, memory: 1024 * 2, diskSize: 100 }
  - **Recommended**: {cpu: 4, memory: 1024 * 4, diskSize: 250 }
  - Or choose a **Custom** plan

- Choose a node to deploy Caprover on.
- Either use the **Capacity Filter**. Which simply lets you pick a *Farm* and *Country*, after clicking on *Apply filters and suggest nodes* then it lists available nodes with these preferences and you pick.

</details>

<details><summary>Deploying a worker node
</summary>

<div class="div-img">
<img src="img/caprover_deploy_worker.png" class="thumbnail"  width="60%" height="60%">
<div>

- Click `Add` button to add a new worker.
- Select a capacity package:
  - **Minimum**: {cpu: 1, memory: 1024, diskSize: 50 }
  - **Standard**: {cpu: 2, memory: 1024 * 2, diskSize: 100 }
  - **Recommended**: {cpu: 4, memory: 1024 * 4, diskSize: 250 }
  - Or choose a **Custom** plan

- Choose a node to deploy Caprover on.
- Either use the **Capacity Filter**. Which simply lets you pick a *Farm* and *Country*, after clicking on *Apply filters and suggest nodes* then it lists available nodes with these preferences and you pick.

- Or use **Manual** and type a specific node number to deploy on.

Deployment will take couple of minutes.

</details>

<details><summary>How to find my deployments ip address?
</summary>

Go back to your CapRover weblet and go to the deployment list. Click on `Show Details`.

<div class="div-img">
<img src="img/caprover_detail_weblet.png" class="thumbnail"  width="60%" height="60%">
<div>

- The public IPv4 address is visible in here
- Now you can configure the domain name (see above, don't forget to point the wildcard domain to the public IP address)

Click on details if you want to see more details

```json

{
    "version": 0,
    "name": "caprover_leader_cr_156e44f0",
    "created": 1637843368,
    "status": "ok",
    "message": "",
    "flist": "https://hub.grid.tf/samehabouelsaad.3bot/tf-caprover-main-a4f186da8d.flist",
    "publicIP": {
        "ip": "185.206.122.136/24",
        "gateway": "185.206.122.1"
    },
    "planetary": false,
    "yggIP": "",
    "interfaces": [
        {
            "network": "caprover_network_cr_156e44f0",
            "ip": "10.200.4.2"
        }
    ],
    "capacity": {
        "cpu": 4,
        "memory": 8192
    },
    "mounts": [
        {
            "name": "data0",
            "mountPoint": "/var/lib/docker",
            "size": 107374182400,
            "state": "ok",
            "message": ""
        }
    ],
    "env": {
        "SWM_NODE_MODE": "leader",
        "CAPROVER_ROOT_DOMAIN": "apps.openly.life",
        "PUBLIC_KEY": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC/9RNGKRjHvViunSOXhBF7EumrWvmqAAVJSrfGdLaVasgaYK6tkTRDzpZNplh3Tk1aowneXnZffygzIIZ82FWQYBo04IBWwFDOsCawjVbuAfcd9ZslYEYB3QnxV6ogQ4rvXnJ7IHgm3E3SZvt2l45WIyFn6ZKuFifK1aXhZkxHIPf31q68R2idJ764EsfqXfaf3q8H3u4G0NjfWmdPm9nwf/RJDZO+KYFLQ9wXeqRn6u/mRx+u7UD+Uo0xgjRQk1m8V+KuLAmqAosFdlAq0pBO8lEBpSebYdvRWxpM0QSdNrYQcMLVRX7IehizyTt+5sYYbp6f11WWcxLx0QDsUZ/J"
    },
    "entrypoint": "/sbin/zinit init",
    "metadata": "",
    "description": "caprover leader machine/node"
}
```
</details>

<details><summary>Setting your DNS records
</summary>

- e.g. I picked ```apps.openly.life``` which is a domain name that will point to the ip address of the CapRover instance (which we only know after deployment).

<div class="div-img">
<img src="img/domain_name_caprover_config.png" class="thumbnail"  width="60%" height="60%">
<div>

> Note how the *.apps.openly.life points to the public IPv4 address that has been returned from the deployment.
</details>

<details><summary>how to add a new worker node to your cluster
</summary>

## Step 1: Add a default docker registry

You'll have to add a default docker registry so other CapRover nodes in the cluster can download images from, and it can be self-hosted (managed by CapRover itself), to add it, go to `Cluster` -> `Docker Registry Configuration`.

<div class="div-img">
<img src="img/caprover_docker_registry.png" class="thumbnail"  width="60%" height="60%">
<div>

- Click `Add Self-Hosted Registry` button, then click `Enable Self-Hosted Registry`

<div class="div-img">
<img src="img/caprover_docker_default_registry.png" class="thumbnail"  width="60%" height="60%">
<div>

You can check [official documentation](https://caprover.com/docs/app-scaling-and-cluster.html#setup-docker-registry) to know more about Docker registry options.

## Step 2: Attach a new node to the cluster

<img src="img/caprover_add_worker.png" class="thumbnail"  width="60%" height="60%">
<div>

- Add the public IPv4 address that has been returned from the worker deployment in the `New node IP Address` field.
- Add your `SSH private key` (you can use this command `cat ~/.ssh/id_rsa` to get your private key).
- Click `Join cluster` button.

</details>

<details><summary>Getting Started With Caprover
</summary>

## How to access the admin interface ?

- make sure your public IP address (in my case ```185.206.122.136```) is filled in in the domain name record.

> admin url: <https://captain.apps.openly.life/>   (note prefix captain, and the usage of our wildcard domain).
</br>
> The password is generated and visible behind the `Show Details` button of your CapRover deployment.

<div class="div-img">
<img src="img/caprover_login.png" class="thumbnail"  width="60%" height="60%">
<div>

You should now see

<div class="div-img">
<img src="img/captain_login+weblet_caprover_.png" class="thumbnail"  width="60%" height="60%">
<div>

## Step 1: Enable https

<div class="div-img">
<img src="img/enable_https_caprover.png" class="thumbnail"  width="60%" height="60%">
<div>

You need to specify your email address.

You will have to login again.

<div class="div-img">
<img src="img/caprover_https_activated.png" class="thumbnail"  width="60%" height="60%">
<div>

> Now force https.

You will have to login again, and you should notice https is now used.

## Step 2: Add a default docker registry
You'll have to add a default docker registry so other CapRover nodes in the cluster can download images from, and it can be self-hosted (managed by CapRover itself), to add it, go to `Cluster` -> `Docker Registry Configuration`.

<div class="div-img">
<img src="img/caprover_docker_registry.png" class="thumbnail"  width="60%" height="60%">
<div>

You can check [official documentation](https://caprover.com/docs/app-scaling-and-cluster.html#setup-docker-registry) to know more about Docker registry options.
## Step 3: Deploy an app

<div class="div-img">
<img src="img/deploy_app_caprover1.png" class="thumbnail"  width="60%" height="60%">
<div>

just go to apps & follow the instructions, there is much more info on caprover website.

## Step 4: Enable monitoring

<div class="div-img">
<img src="img/caprover_monitoring_start_.png" class="thumbnail"  width="60%" height="60%">
<div>

You should now see

<div class="div-img">
<img src="img/caprover_monitoring_2_.png" class="thumbnail"  width="60%" height="60%">
<div>

## Step 5: Lets add nodes to caprover

- Go to the settings

<div class="div-img">
<img src="img/caprover_cluster.png" class="thumbnail"  width="60%" height="60%">
<div>

- Fill in your mnemonic from TF-Chain, make sure it's the right network you are connected to
- Set your store secret for storing deployment information securely on TF-Chain.
- Add your SSH-key

Now go to `Cluster -> Deploy a new node on Threefold grid`, specify the details of the resources you need and then click **Search resources...** :

<div class="div-img">
<img src="img/cluster_add_nodes.png" class="thumbnail"  width="60%" height="60%">
<div>

If there are enough resources, a new window will appear listing possible nodes to deploy this node to, select one of them and click **Deploy**:

<div class="div-img">
<img src="img/caprover_select_node.png" class="thumbnail"  width="60%" height="60%"><
<div>

You should then see something like

<div class="div-img">
<img src="img/caprover_add_node2.png" class="thumbnail"  width="60%" height="60%">
<div>

This should typically take less than 2 minutes.

> Important: the deployment process takes some time before it is known in CapRover.

Go out of the form and back to `Cluster`.

<div class="div-img">
<img src="img/caprover_node_added.png" class="thumbnail"  width="60%" height="60%">
<div>

## Step 6: Change your password

- Go to `Settings` and change your password. This is important for your own security.


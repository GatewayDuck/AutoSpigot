# AutoSpigot
Make a spigot server with a script



# How to install
Just the the command
```bash
$   apt install curl
```
```bash
$   bash <(curl -s https://raw.githubusercontent.com/GatewayDuck/AutoSpigot/main/install.sh_)
```

# OS
Works with most Linux based OS

Tested with Ubuntu 20.04 - 22.04

# System Requiments
A server running Ubuntu 20.04 (some other systems may work) with a minimum of 4GB RAM and 2 CPU Cores.


# Starting the server
To start the server cd into the dir
```bash
$   cd (dir)/minecraftServers/(serverName)/
```
then run
```bash
./control start
```
this will automatly start the server with 3GBs of ram (there is no way to currently change that)

if you are using the VPS you can use a program called `screen` to keep the server open even after u close out of ssh

you can read more [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-screen-on-an-ubuntu-cloud-server)

you need java 8 for 1.16.x >

you need java 16 for 1.17.x >

you need java 17 for 1.18.x >

and you need java 18 for 1.19.x >

you can install all the javas and use a java switcher, but they java verison for the correct verison must be installed / used when creating the server

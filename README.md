# Docker container for Micmac and Sfm scripts
Some scripts for Structure from Motion in a docker container, based on the MicMac library

The scripts can be cloned from here if you wish to do this all separately - there are instructions

https://github.com/Ciaran1981/Sfm


Micmac is a photogrammetry software developped by IGN (French National Geographic Institute) under CeCILL-B licence

Official website : http://logiciels.ign.fr/?Micmac

Github repository : https://github.com/micmacIGN/micmac


**What is docker ?**

Docker is an ability to run virtual machine easily. You could build a container like this one for the sfm scripts & Micmac under every system. You just have to install docker on your system



**Why a docker container for Scripts  and Micmac ?**

Micmac is straight forward enough to install, but for ease of use there was no harm! It also may be useful for HPC use. 



**How to run micmac-docker container ?**

First you have to build the container by typing in a terminal :

`docker build -t cir10/micmac git://github.com/Ciaran1981/micmac-docker`

Then you could launch micmac commands from docker with :

`docker run -it cir10/micmac mm3d`

And any of the shell and python scripts with the same way :

`docker run -it Orientation.sh -e JPG -u "30 +north" -i 3000 -c Fraser -t Log.csv -s sub.csv`

Watch your container : 

`docker images`


**How can I delete this thing ?**

Just remove it with docker : 

`docker rmi -f cir10/micmac`



Feel free to fork. Have fun !


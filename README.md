# Docker container for Micmac
Micmac in a docker container
Micmac is a photogrammetry software developped by IGN (French National Geographic Institute) under CeCILL-B licence

Official website : http://logiciels.ign.fr/?Micmac

Github repository : https://github.com/micmacIGN/micmac


**What is docker ?**

Docker is an ability to run virtual machine easyly. You could build a container like this one for Micmac under every system. You just have to install docker on your system



**Why a docker container for Micmac ?**

Micmac is straight forward enough to install, but for ease of use there was no harm!



**How to run micmac-docker container ?**

First you have to build the container by typing in a terminal :

`docker build -t cir10/micmac git://github.com/Ciaran1981/micmac-docker`

Then you could launch CLI binaries from docker with 

`docker run -it cir10/micmac mm3d`

Watch your container : 

`docker images`


**How can I delete this thing ?**

Just remove it with docker : 

`docker rmi -f cir10/micmac`


**Mercurial repository of Micmac is updated, how could I update micmac ?**

`docker run -it cir10/micmac update_micmac.sh`



Feel free to fork. Have fun !


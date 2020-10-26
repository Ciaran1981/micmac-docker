# Docker container for Micmac and Sfm scripts
A docker container for pycmac & MicMac

Pycmac is a python lib for using MicMac for convenience and some enhancements
https://github.com/Ciaran1981/pycmac

Micmac is a photogrammetry software developped by IGN (French National Geographic Institute) under CeCILL-B licence

Official website : http://logiciels.ign.fr/?Micmac

Github repository : https://github.com/micmacIGN/micmac


**What is docker ?**

Docker is an ability to run virtual machine easily. You could build a container like this one for the sfm scripts & Micmac under every system. You just have to install docker on your system


**How to run micmac-docker container ?**

First you have to build the container by typing in a terminal :

`docker build -t cir10/micmac git://github.com/Ciaran1981/micmac-docker`


**How can I delete this thing ?**

Just remove it with docker : 

`docker rmi -f cir10/micmac`



Feel free to fork. Have fun !


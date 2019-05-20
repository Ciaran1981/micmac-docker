FROM ubuntu:latest

MAINTAINER Ciaran Robb  cir10/docker-micmac

#Install dependencies
RUN apt-get update && apt-get install -y --install-recommends \
x11proto-core-dev make cmake libx11-dev imagemagick gcc g++ \
exiv2 libimage-exiftool-perl libgeo-proj4-perl \ 
mesa-common-dev libgl1-mesa-dev libglapi-mesa libglu1-mesa \
qt5-default doxygen opencl-headers git



#get micmac
RUN git clone https://github.com/micmacIGN/micmac.git micmac

#folders etc
RUN cd micmac
RUN mkdir build
RUN cd ..

#make micmac without gpu -DBUILD_POISSON=1 

RUN cmake /micmac -DWITH_QT5=1 -DBUILD_RNX2RTKP=1 -DWITH_OPENCL=ON -DWITH_OPEN_MP=ON -DWITH_ETALONPOLY=ON -DWITH_DOXYGEN=ON 

RUN cd /micmac
RUN make 
RUN make install -j4



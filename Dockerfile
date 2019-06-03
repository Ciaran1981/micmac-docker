FROM ubuntu:latest

MAINTAINER Ciaran Robb  cir10/docker-micmac

#LABEL authors="Pete Bunting"
#LABEL maintainer="petebunting@mac.com"

#Install dependencies
RUN apt-get update && apt-get install -y --install-recommends \
x11proto-core-dev make cmake libx11-dev imagemagick gcc g++ \
exiv2 libimage-exiftool-perl libgeo-proj4-perl \ 
mesa-common-dev libgl1-mesa-dev libglapi-mesa libglu1-mesa \
qt5-default doxygen opencl-headers git graphviz && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


#RUN mkdir /opt
WORKDIR /opt

#get micmac
RUN git clone https://github.com/micmacIGN/micmac.git micmac

#folders etc

RUN mkdir -p micmac/build

WORKDIR /opt/micmac

#make micmac without gpu 

RUN cmake -DWITH_QT5=1 -DBUILD_RNX2RTKP=1 -DBUILD_POISSON=1 -DWITH_OPENCL=ON -DWITH_OPEN_MP=OFF -DWITH_ETALONPOLY=ON -DWITH_DOXYGEN=ON .

RUN make 
RUN make install 

RUN git clone git@github.com:Ciaran1981/Sfm.git

WORKDIR /Sfm

RUN chmod +x $PWD *.sh
RUN chmod +x $PWD *.py

RUN chmod +x $PWD substages/*.sh
RUN chmod +x $PWD substages/*.py

WORKDIR /Sfm/micasense

RUN python setup.py install

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD [ "/bin/bash" ]



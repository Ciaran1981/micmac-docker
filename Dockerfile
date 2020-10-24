FROM ubuntu:latest

MAINTAINER Ciaran Robb  cir10/docker-micmac

#Install dependencies
RUN apt-get update && apt-get install -y --install-recommends \
x11proto-core-dev make cmake libx11-dev imagemagick gcc g++ \
exiv2 libimage-exiftool-perl libgeo-proj4-perl \ 
mesa-common-dev libgl1-mesa-dev libglapi-mesa libglu1-mesa \
qt5-default doxygen opencl-headers git graphviz wget && \
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

RUN cmake -DWITH_QT5=1 -DBUILD_RNX2RTKP=1 -DBUILD_POISSON=1 -DWITH_ETALONPOLY=ON -DWITH_DOXYGEN=ON .

RUN make -j$(nproc)
RUN make install 

RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/miniconda && \
    rm ~/miniconda.sh && \
    /opt/miniconda/bin/conda clean -tipsy && \
    ln -s /opt/miniconda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /opt/miniconda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc

ENV PATH /opt/miniconda/bin:$PATH

RUN git clone https://github.com/Ciaran1981/pycmac.git

WORKDIR /opt/pycmac

ls /opt/pycmac

RUN conda env create -f pycmac_env.yml

RUN conda activate pycmac

# Add Tini
ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--"]

CMD [ "/bin/bash" ]



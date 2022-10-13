FROM ubuntu:20.04
#update and upgrade the linux filesystem 
RUN apt-get -y update && apt-get -y upgrade
#set timezone to athens greece
RUN ln -fs /usr/share/zoneinfo/Europe/Athens /etc/localtime
#install basic essentials
RUN apt-get install -y sudo \
    gcc \
    g++ \
    git \
    nodejs \
    npm \
    wget \
    curl \
    libssl-dev
#install build essentials
RUN apt-get -y update && sudo apt-get -y install build-essential
#install cmake(propably v16)
RUN sudo apt-get -y install cmake
#install python 2 
RUN sudo apt-get -y install python
#install pip
RUN sudo apt update && curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py && sudo python2 get-pip.py
#install python 3
RUN sudo apt-get -y install python3
#install usd dependencies
RUN pip install pyside2 PyOpenGL
#download from git repository
RUN cd /home && git clone https://github.com/PixarAnimationStudios/USD
#install lib
RUN sudo apt-get -y install libtbb-dev \
    python-dev \
    libx11-dev
RUN sudo apt-get update && sudo apt-get -y install mesa-common-dev
RUN sudo apt-get update && sudo apt-get -y install libgl1-mesa-dev
RUN sudo apt-get update && sudo apt-get -y install libglu1-mesa-dev && sudo apt-get -y install libglew-dev
#install opencv and PyOpenGl_accelerate
RUN sudo apt-get update && sudo apt-get install -y python3-opencv && pip install PyOpenGl_accelerate
#install USD
RUN cd /home && python USD/build_scripts/build_usd.py /usr/local/USD
#install usd_from_gltf dependencies 
RUN sudo apt-get install -y nasm && pip install Pillow
#clone usd_from_gltf repository and install usd_from_gltf without test data
RUN cd /home && git clone https://github.com/google/usd_from_gltf.git && python usd_from_gltf/tools/ufginstall/ufginstall.py /usr/local/UFG /usr/local/USD
# #clone usd_from_gltf repository and install usd_from_gltf with test data
# RUN cd /home && git clone https://github.com/google/usd_from_gltf.git && python usd_from_gltf/tools/ufginstall/ufginstall.py /usr/local/UFG /usr/local/USD --testdata

RUN mkdir -p /usdz

COPY . /usdz

WORKDIR /usdz

RUN npm install

EXPOSE 4200

ENTRYPOINT ["node","rest" ]
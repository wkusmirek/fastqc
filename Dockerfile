FROM ubuntu:16.04
MAINTAINER kusmirekwiktor@gmail.com

RUN apt-get update && \
 apt-get upgrade -y && \
 apt-get install -y wget bzip2 gcc python git build-essential pkg-config

RUN wget https://github.com/agordon/libgtextutils/releases/download/0.7/libgtextutils-0.7.tar.gz && \
  tar -xvf libgtextutils-0.7.tar.gz && \
  cd libgtextutils-0.7 && \
  ./configure && \
  make && \
  make install && \
  cd /

RUN wget https://github.com/agordon/fastx_toolkit/releases/download/0.0.14/fastx_toolkit-0.0.14.tar.bz2

RUN tar -xvf fastx_toolkit-0.0.14.tar.bz2

RUN cd fastx_toolkit-0.0.14; ./configure; make; make install

RUN apt-get install -y unzip

RUN wget http://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.11.5.zip && \
  unzip fastqc_v0.11.5.zip && \
  cd FastQC && \
  chmod 755 fastqc

RUN apt-get install -y default-jre

RUN apt-get install -y default-jdk

ENV PATH="/FastQC/:${PATH}"

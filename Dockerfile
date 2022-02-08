FROM ubuntu:18.04
LABEL maintainer="Two Six Technologies <race@twosixlabs.com>"

RUN apt-get update -y && \
  apt install -y less curl unzip

RUN mkdir -p /usr/local/android-sdk \
  && cd /usr/local/android-sdk/ \
  && curl -OL https://dl.google.com/android/repository/platform-tools-latest-linux.zip \
  && unzip platform-tools-latest-linux.zip \
  && rm -f platform-tools-latest-linux.zip \
  && ln -s /usr/local/android-sdk/platform-tools/adb /usr/bin/adb

# Install Python 3.8 & Configure Python Environment
RUN apt-get -y update && \
    apt-get install -y python3.8 python3.8-dev python3-pip && \
    python3.8 -m pip install --upgrade --force-reinstall pip && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3.8 1 && \
    update-alternatives --set python /usr/bin/python3.8 && \
    update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1 && \
    update-alternatives --set python3 /usr/bin/python3.8 && \
    update-alternatives --install /usr/bin/python3-config python3-config /usr/bin/python3.8-config 1 && \
    update-alternatives --set python3-config /usr/bin/python3.8-config

RUN python3.8 -m pip install setuptools && \
    python3.8 -m pip install pure-python-adb sh

RUN mkdir -p /code
WORKDIR /code

COPY python_adb_example.py /code

FROM ubuntu:18.04
LABEL maintainer="Two Six Technologies <race@twosixlabs.com>"

RUN apt-get update -y && \
  apt install -y less curl unzip

RUN mkdir -p /usr/local/android-sdk \
  && cd /usr/local/android-sdk/ \
  && curl -OL https://dl.google.com/android/repository/platform-tools-latest-linux.zip \
  && unzip platform-tools-latest-linux.zip \
  && rm -f platform-tools-latest-linux.zip \
  && ln -s /usr/local/android-sdk/platform-tools/adb /usr/bin/adb \
  && export PATH=/usr/local/android-sdk/platform-tools:${PATH} \
  && echo "export PATH=/usr/local/android-sdk/platform-tools:${PATH}" >> /etc/profile

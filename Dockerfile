FROM debian:latest
MAINTAINER Alex Thorpe <alexander.thorpe@cambiahealth.com>

# Add custom files
# TODO: Figure out why `ADD files /` creates a huge layer
ADD files/root/bashrc /root/.bashrc
ADD files/usr/bin/apt-install /usr/bin/apt-install

# Install wget
RUN apt-install wget ca-certificates

# Updates
RUN apt-install libc6

# Install Bats
RUN wget https://github.com/innovation-force/bats/archive/v0.4.0.tar.gz && \
    tar xzf v0.4.0.tar.gz && cd bats-0.4.0 && ./install.sh /usr/local && \
    cd .. && rm -rf v0.4.0.tar.gz bats-0.4.0

# Integration tests
ADD test /tmp/test
RUN bats /tmp/test

CMD /bin/bash

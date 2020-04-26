FROM ubuntu:bionic

MAINTAINER rootlifted <rootlifted@gmail.com>

LABEL n4h.version=2020.04.25

ARG DEBIAN_FRONTEND=noninteractive

# Allow man files and docs to be installed.
RUN rm /etc/dpkg/dpkg.cfg.d/excludes

# Re-install all installed packages (to install man pages and documentation).
RUN apt-get -qy update && \
    apt-get -qy install apt-utils && \
    dpkg -l | grep ^ii | cut -d' ' -f3 | xargs apt-get install -qy --reinstall && \
    rm -r /var/lib/apt/lists/*

# Install some basic toys.
RUN apt-get -qy update && \
    apt-get -qy install man-db && \
    apt-get -qy install man-db && \
    apt-get -qy install manpages && \
    apt-get -qy install manpages-dev && \
    apt-get -qy install manpages-posix && \
    apt-get -qy install manpages-posix-dev && \
    apt-get -qy install vim && \
    apt-get -qy install gawk && \
    apt-get -qy install curl && \
    apt-get -qy install uuid && \
    apt-get -qy install libxml2-utils && \
    apt-get -qy install xmlstarlet && \
    apt-get -qy install nano && \
    apt-get -qy install wbritish-insane && \
    apt-get -qy purge mawk

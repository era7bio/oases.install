#!/bin/sh
# need to remove this because oases/velvet make signal error
# if they cannot build their manuals with pdflatex (!!)
# set -e -x

# installer for oases
#
# create your base folder
mkdir -p /opt/oases
# do the work
yum -y install zlib zlib-devel
git clone git@github.com:dzerbino/oases /opt/oases
cd /opt/oases
git clone git@github.com:dzerbino/velvet
cd velvet
# compile velvet
make 'MAXKMERLENGTH=99'
# go back to oases
cd ..
# compile oases
make 'VELVET_DIR=velvet' 'MAXKMERLENGTH=99'
ln -sf /opt/oases/oases /usr/bin/


#! /bin/bash
# install SHC for bash compile
# compile *.sh tool to binary

cd $HOME
echo "installing SHC to compile uber tools ... "
git clone https://github.com/neurobin/shc.git
cd shc
./configure --prefix=$HOME
# defensive error handling
touch configure.ac aclocal.m4 configure Makefile.am Makefile.in
make
make install
rm -rf shc

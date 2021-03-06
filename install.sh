#!/bin/sh

echo "Installing required packages"

sudo apt-get update
sudo apt-get -y upgrade
sudo apt-get -y dist-upgrade
sudo apt-get -y install build-essential golang-1.10-go unzip redis-server nginx screen
sudo ln -s /usr/lib/go-1.10/bin/go /usr/local/bin/go
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

echo "Checking go & node version"

go version
node -v

echo "Installing EOS Classic"

git clone -b stable https://github.com/eosclassic/go-eosclassic
cd go-eosclassic
make geth
sudo cp build/bin/geth /usr/local/bin/geth

echo "EOS Classic version"

geth version

echo "Installing EOS Classic Pool Software"

git clone https://github.com/eosclassic/open-eosc-pool
cd open-eosc-pool
make all
sudo cp build/bin/open-eosc-pool /usr/local/bin/open-eosc-pool

echo "Done installing EOS Classic & EOS Classic Pool Software!, Please configure your pool with the following instructions on https://github.com/eosclassic/open-eosc-pool/blob/master/README.md"

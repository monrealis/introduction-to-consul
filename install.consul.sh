#!/usr/bin/env bash

# Install unzip
sudo apt-get update
sudo apt-get install -y unzip bc stress

cat >> ~/.bashrc <<"END"

# Coloring of hostname in prompt to keep track of what's what in demos, blue provides a little emphasis but not too much like red
NORMAL="\[\e[0m\]"
BOLD="\[\e[1m\]"
DARKGRAY="\[\e[90m\]"
BLUE="\[\e[34m\]"
PS1="$DARKGRAY\u@$BOLD$BLUE\h$DARKGRAY:\w\$ $NORMAL"

END

# Download consul
CONSUL_VERSION=0.6.4
curl https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -o consul.zip

# Install consul
unzip consul.zip
sudo chmod +x consul
sudo mv consul /usr/bin/consul

exit 0

# Create config directory
sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d

# Install common consul config
sudo cp /vagrant/provision/common-consul.d/* /etc/consul.d

# Install upstart job
sudo cp /vagrant/provision/upstart/consul.conf /etc/init/.

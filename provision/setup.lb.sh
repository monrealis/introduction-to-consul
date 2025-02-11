#!/bin/bash

cp /vagrant/provision/haproxy.cfg /home/vagrant/.

docker run -d --name haproxy -p 80:80 --restart unless-stopped -v /home/vagrant/haproxy.cfg:/usr/local/etc/haproxy/haproxy.cfg:ro haproxy:1.6.5-alpine

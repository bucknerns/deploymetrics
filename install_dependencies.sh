#!/bin/bash
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.1/elasticsearch-2.3.1.deb
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update 
apt-get install -qy nginx redis-server docker.io oracle-java8-installer
dpkg -i elasticsearch-2.3.1.deb
echo 'server {
	listen 80 default_server;
	server_name _;
        include /configs/*.conf;
}'> /etc/nginx/sites-enabled/default

echo network.host: 127.0.0.1 > /etc/elasticsearch/elasticsearch.yml
echo http.port: 9200  >> /etc/elasticsearch/elasticsearch.yml
service nginx restart
service elasticsearch restart

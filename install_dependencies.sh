#!/bin/bash
wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.1/elasticsearch-2.3.1.deb
apt-get install nginx redis-server docker.io
dpkg -i elasticsearch-2.3.1.deb
echo 'server {
	listen 80 default_server;
	server_name _;
        include /etc/nginx/uwsgi-enabled/*.conf;
}'> /etc/nginx/sites-enabled/default

echo network.bind_host: 127.0.0.1 > /etc/elasticsearch/elasticsearch.yml
echo http.port: 9200  >> /etc/elasticsearch/elasticsearch.yml
service nginx restart
service elasticsearch restart

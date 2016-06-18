#!/bin/bash
sudo apt-get update
apt-get install -qy nginx redis-server docker.io software-properties-common nano net-tools git wget python build-essential python-dev
echo 'server {
	listen 80 default_server;
	server_name _;
        include /configs/*.conf;
}'> /etc/nginx/sites-enabled/default

git clone https://github.com/bucknerns/metricsandstuff
cp -r metricsandstuff/doc /var/www
echo 'location /doc {
    root /var/www;
    index index.html;
}' > /configs/docs.conf

# below this is just for subunit2redis populate script
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install virtualenv
virtualenv env
/root/env/bin/pip install -e ./metricsandstuff/


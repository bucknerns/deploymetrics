#!/bin/bash
source /root/env/bin/activate
cp /root/uwsgi.ini /configs/api.ini
cp /root/nginx.conf /configs/api.conf
cd /root/metricsandstuff
git pull
uwsgi --ini /configs/uwsgi.ini

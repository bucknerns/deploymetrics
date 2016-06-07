FROM ubuntu:16.04

VOLUME /sockets
VOLUME /pids
VOLUME /logs
VOLUME /configs

WORKDIR /root
RUN echo 'deb http://mirrors.gigenet.com/ubuntuarchive/ xenial multiverse' >> /etc/apt/sources.list
RUN echo 'deb-src http://mirrors.gigenet.com/ubuntuarchive/ xenial multiverse' >> /etc/apt/sources.list
RUN apt-get update -qq && apt-get -qq upgrade
RUN apt-get install -qy software-properties-common nano net-tools git wget python build-essential python-dev
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py
RUN pip install virtualenv uwsgi
RUN virtualenv env
RUN git clone https://github.com/bucknerns/metricsandstuff #
WORKDIR /root/metricsandstuff
RUN git checkout redis_test
RUN /root/env/bin/pip install -e . #asdf
COPY uwsgi.ini /root/uwsgi.ini
COPY nginx.conf /root/nginx.conf
COPY run.sh /root/run.sh
CMD ["/root/run.sh"]

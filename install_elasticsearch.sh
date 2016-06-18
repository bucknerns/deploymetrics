wget https://download.elastic.co/elasticsearch/release/org/elasticsearch/distribution/deb/elasticsearch/2.3.1/elasticsearch-2.3.1.deb
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt-get update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt-get install oracle-java8-installer
dpkg -i elasticsearch-2.3.1.deb
echo network.host: 127.0.0.1 > /etc/elasticsearch/elasticsearch.yml
echo http.port: 9200  >> /etc/elasticsearch/elasticsearch.yml
service elasticsearch restart

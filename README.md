This is a Dockerfile setup for nzbget - http://nzbget.net/

To run:

```
sudo docker run  -dt --name="nzbget" -v /etc/localtime:/etc/localtime:ro  -v /shares:/shares -p 8080:8080 --restart always nzbget
```

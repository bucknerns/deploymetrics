#!/bin/bash
LOCAL_SOCKETS="/sockets"
LOCAL_PIDS="/pids"
LOCAL_CONFIGS="/configs"
LOCAL_LOGS="/logs"
FLAGS=" -dt --restart always -v /etc/localtime:/etc/localtime:ro  --net=host --privileged "
RUN="sudo docker run $FLAGS"
API_RUN="$RUN -v $LOCAL_CONFIGS:/configs -v $LOCAL_PIDS:/pids -v $LOCAL_SOCKETS:/sockets -v $LOCAL_LOGS:/logs --name=api api"
KIBANA_RUN="$RUN -e ELASTICSEARCH_URL=http://127.0.0.1:9200 --name=kibana kibana"


if [ "$#" -lt 1 ]; then
  $API_RUN
  $KIBANA_RUN
else
  case "$1" in
    "api" )
      $API_RUN
    ;;
    "kibana" )
      $KIBANA_RUN
    ;;
    "rm" )
      if [ "$#" -lt 2 ]; then
        sudo docker rm -f api kibana
      fi
    ;;
    *) echo "Invalid option. Try another one.";;
    esac
fi

#!/bin/bash
BUILD="sudo docker build "
API_BUILD="$BUILD -t api ./api"
KIBANA_BUILD="sudo docker pull kibana:4.5"
$KIBANA_BUILD
if [ "$#" -lt 1 ]; then
  $API_BUILD
else
  case "$1" in
    "api" )
      $API_BUILD
    ;;
    "kibana" )
    ;;
    "rm" )
      if [ "$#" -lt 2 ]; then
        sudo docker rmi api
      fi
    ;;
    *) echo "Invalid option. Try another one.";;
    esac
fi


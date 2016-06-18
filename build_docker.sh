#!/bin/bash
BUILD="sudo docker build "
API_BUILD="$BUILD -t api ./api"
KIBANA_BUILD="sudo docker pull kibana:4.5"

if [ "$#" -lt 1 ]; then
  $API_BUILD
  $KIBANA_BUILD
else
  case "$1" in
    "api" )
      $API_BUILD
    ;;
    "kibana" )
      $KIBANA_BUILD
    ;;
    "rm" )
      if [ "$#" -lt 2 ]; then
        sudo docker rmi -f api kibana
      fi
    ;;
    *) echo "Invalid option. Try another one.";;
    esac
fi


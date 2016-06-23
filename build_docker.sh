#!/bin/bash
ROOT_UID="0"

#Check if run as root
if [ "$UID" -ne "$ROOT_UID" ] ; then
	echo "You must be root to do that!"
	exit 1
fi
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


#!/bin/bash
./install_api_dependencies.sh
./build_docker.sh api
./start_docker.sh api
sleep 5
service nginx restart
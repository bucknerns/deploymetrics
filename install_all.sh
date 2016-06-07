#!/bin/bash
./install_dependencies.sh
./build_docker.sh
./start_docker.sh
sleep 5
service nginx restart
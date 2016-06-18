#!/bin/bash
./install_api.sh
./install_elasticsearch.sh
./build_docker.sh kibana
./start_docker.sh kibana

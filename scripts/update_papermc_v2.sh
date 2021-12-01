#!/bin/bash

echo "Attempting automatic update of PaperMC (v2 API)"

project="paper"
latest_version_group=$(curl -s "https://papermc.io/api/v2/projects/paper"  | jq -r ".version_groups | .[-1]")
latest_build=$(curl -s "https://papermc.io/api/v2/projects/paper/versions/$latest_version_group" | jq -r ".builds | .[-1]")
filename=$(curl -s "https://papermc.io/api/v2/projects/paper/versions/$latest_version_group/builds/$latest_build" | jq -r ".downloads.application.name")
echo latest version group: $latest_version_group
echo latest build: $latest_build
echo download filename: $filename

wget -O /srv/minecraft/minecraft_server.jar "https://papermc.io/api/v2/projects/paper/versions/$latest_version_group/builds/$latest_build/downloads/$filename"

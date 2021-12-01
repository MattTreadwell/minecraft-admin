#!/bin/bash

wget -O /srv/minecraft/minecraft_server.jar "https://papermc.io/api/v1/paper/$(curl https://papermc.io/api/v1/paper | jq -r '.versions|.[0]')/latest/download"

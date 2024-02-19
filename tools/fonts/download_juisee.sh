#! /bin/bash

wget -N https://github.com/yuru7/juisee/releases/download/v0.0.6/Juisee_HW_v0.0.6.zip
unzip Juisee_HW_v0.0.6.zip
mkdir -p ~/.fonts
mv Juisee_HW_v0.0.6/* ~/.fonts
# Refhttps://juliamono.netlify.app/download/
fc-cache -f -v
fc-list | grep "Juisee"
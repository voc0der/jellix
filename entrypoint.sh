#!/bin/sh

echo "const API_URL = '${API_URL}';" > /app/params.js
echo "const TRANSLATIONS = '${TRANSLATIONS}';" >> /app/params.js

mkdir -p /home/nginx

forward='s/80;/'$PORT';/'
exists=/home/nginx/default.conf

if test -f "$exists"; then
    cp /home/nginx/default.conf /etc/nginx/conf.d/default.conf
else
    cp /etc/nginx/conf.d/default.conf /home/nginx/default.conf
fi

sed -i "$forward" /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'

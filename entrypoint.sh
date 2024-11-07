#!/bin/sh

echo "const API_URL = '${API_URL}';" > /app/params.js
echo "const TRANSLATIONS = '${TRANSLATIONS}';" >> /app/params.js

regex='s/80;/'$PORT';/'
sed -i $regex /etc/nginx/conf.d/default.conf

nginx -g 'daemon off;'
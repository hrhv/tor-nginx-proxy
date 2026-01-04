#!/bin/sh

# Fix NGINX_PROXY_HOST in the generated nginx config if it's still the placeholder
# This runs after template processing but before nginx starts
# If NGINX_PROXY_HOST was not explicitly set (or is the placeholder), use nginx variables
if [ -z "$NGINX_PROXY_HOST" ] || [ "$NGINX_PROXY_HOST" = "__NGINX_HOST_PLACEHOLDER__" ]; then
    # Replace placeholder with nginx variables $host:$server_port
    sed -i 's/proxy_set_header Host __NGINX_HOST_PLACEHOLDER__;/proxy_set_header Host $host:$server_port;/g' /etc/nginx/conf.d/default.conf
fi


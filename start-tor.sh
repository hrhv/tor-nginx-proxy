#!/bin/sh

# Print Tor Onion URL to the console in purple color
# The value is stored in the file /var/lib/tor/hidden_service/hostname
echo -e "\033[35mTor Onion URL: \033[0m$(cat /var/lib/tor/hidden_service/hostname)"

# Start tor
tor -f /etc/tor/torrc &
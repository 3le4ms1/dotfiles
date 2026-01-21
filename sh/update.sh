#!/usr/bin/env sh

set -e

if [ -f /usr/bin/apt ]; then
    # Debian Baased
    apt update && apt upgrade
elif [ -f /usr/bin/apk ]; then
    # Alpine based
    apk update && apk upgrade
elif [ -f /usr/sbin/pkg ]; then
    # FreeBSD
    pkg update && pkg upgrade
else
    echo "Error: no supported package manager found"
fi

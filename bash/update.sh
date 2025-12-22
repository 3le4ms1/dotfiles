#!/usr/bin/sh

set -e

if [ -f /usr/bin/apt ]; then
    apt update && apt upgrade
elif [ -f /usr/bin/apk ]; then
    apk update && apk upgrade
else
    echo "Error: no supported package manager found"
fi

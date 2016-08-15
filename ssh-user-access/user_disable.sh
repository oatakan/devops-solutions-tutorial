#!/bin/bash

# Bash shell script for revoking SSH access on a system for a user

# Script accepts one arguments, user
USERNAME="$1"
if [ -z "${USERNAME}" ]; then
  echo "Usage: $(basename $0) <username>"
  exit 11
fi

# disable login
usermod -s $(which nologin) ${USERNAME}

# disable password
passwd -l ${USERNAME}



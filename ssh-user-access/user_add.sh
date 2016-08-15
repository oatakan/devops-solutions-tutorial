#!/bin/bash

# Bash shell script for granting SSH access on a system for a user given user public key

# Script accepts two arguments, user and public key
USERNAME="$1"
PUBKEY="$2"
if [ -z "${USERNAME}" ] || [ -z "${PUBKEY}" ]; then
  echo "Usage: $(basename $0) <username> <public-key>"
  exit 11
fi


# auto-generate password
PASSWORD=$(tr -cd '[:alnum:]' < /dev/urandom | fold -w30 | head -n1)

# add user with auto-generated password
useradd -p $(openssl passwd -1 ${PASSWORD}) ${USERNAME} -m

# add user key to authorized_keys
sudo -S -u ${USERNAME} -i /bin/bash -l -c 'mkdir -p ~/.ssh'
echo ${PUBKEY} >> /home/${USERNAME}/.ssh/authorized_keys

# expire password
passwd -e ${USERNAME}


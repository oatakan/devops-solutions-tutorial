Add/Remove SSH access for a user

This script assumes that you grant access to a new developer for existing instances where you receive the public key from the user.

Assumptions:

- user exists with public key
- user public key is passed as string


Usage:

sudo ./user_add.sh <username> <public_key>

sudo ./user_disable.sh <username>

You would run this script on the target instance. You can automate this by running this script on each instance from a cm tool like ansible.
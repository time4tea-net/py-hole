#!/bin/bash

# key needs to have been exported with
# gpg --export-secret-key KEYID | base64 -w0

mkdir -p ~/.gnupg
chmod 700 ~/.gnupg
echo "allow-loopback-pinentry" > ~/.gnupg/gpg-agent.conf

# Restart gpg-agent to allow above setting to take effect
gpg-connect-agent reloadagent /bye
#Import key - you don't need a passphrase at this point
echo $GPG_PRIVATE_KEY | base64 --decode | gpg --batch --yes --import

# do something that requires the secret key so that we can unlock it. The gpg agent will remember the passphrase
# this means that later on, the debsign will work...
echo "nothing" > /tmp/$$.tmp

gpg --pinentry-mode loopback --passphrase-fd 3 --sign --batch --yes /tmp/$$.tmp 3< <(echo ${GPG_PASSPHRASE})



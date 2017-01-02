# Py-Hole

An ad-blocker using dnsmasq.

This is a small thing inspired by pi-hole, unfortunately the installation
of pi-hole did too many things for me, so I wanted the same thing, but less
complicated.


# Thanks

Thanks to the pi-hole project for much awesome work and inspiration

# Pre-Alpha Quality

This is not yet ready for installation! - Unless you're feeling brave. It seems to maybe work....

# Build Status

[ ![Codeship Status for time4tea-net/py-hole](https://app.codeship.com/projects/f0842f50-b2ab-0134-db15-5a75b35ed8ee/status?branch=master)](https://app.codeship.com/projects/193330)

# Download it!

[ ![Download](https://api.bintray.com/packages/time4tea/py-hole/py-hole/images/download.svg) ](https://bintray.com/time4tea/py-hole/py-hole/_latestVersion)

# Install It!

```
wget -qO - 'https://bintray.com/user/downloadSubjectPublicKey?username=time4tea' | sudo apt-key add
sudo add-apt-repository "https://dl.bintray.com/time4tea/py-hole time4tea free"
sudo apt-get update
sudo apt-get install py-hole
```

You may need to edit /etc/py-hole/py-hole.json to put in the address of your machine...

# Configure your network to use your server as a DNS server.

... more to add here...




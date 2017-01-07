# Py-Hole

An ad-blocker using dnsmasq.

This is a small thing inspired by pi-hole, unfortunately the installation
of pi-hole did too many things for me, so I wanted the same thing, but less
complicated.


# Thanks

Thanks to the pi-hole project for much awesome work and inspiration

# Install It!

This software is *alpha* quality at best. It may not work for you, or even at all. 

```
wget -qO - 'https://bintray.com/user/downloadSubjectPublicKey?username=time4tea' | sudo apt-key add
echo "deb https://dl.bintray.com/time4tea/py-hole time4tea free" | sudo tee -a /etc/apt/sources.list
sudo apt-get update
sudo apt-get install py-hole
```

This installation will add some dnsmasq configuration to /etc/dnsmasq.d, but it *will not* change
your existing installation. 

It will also NOT change any iptables rules, NOR install php, webservers or anything else. This means
that if your py-hole box is also your DSL gateway all your current firewall settings are intact... Yay!

# Configure It!

You may need to edit /etc/py-hole/py-hole.json to put in the address of your py-hole machine... if you change it then
run

```
sudo /opt/py-hole/py-hole
sudo service dnsmasq reload
```

to regenerate the config, which will happen automatically every night

# Test It!

Assuming you installed py-hole on a server with IP Address 192.168.0.1, try the following command on another 
machine on your network

```
nslookup google.com 192.168.0.1
```

If its working, it should print something like:

```
Server:		192.168.0.1
Address:	192.168.0.1#53

Non-authoritative answer:
Name:	google.com
Address: 172.217.23.14
```

# Configure It!

You'll need to configure your DHCP server, which may be your DSL router, to give out the address of the py-hole
box as the DNS server, rather than the ISP defaults.

# Report It!

If you've got feedback, please tell me at the github issues page:

https://github.com/time4tea-net/py-hole/issues

# Tweet It!

[ Yes! ](https://twitter.com/intent/tweet/?text=py-hole+is+so+awesome&url=https%3A%2F%2Fgithub.com%2Ftime4tea-net%2Fpy-hole)


# Build Status

[ ![Codeship Status for time4tea-net/py-hole](https://app.codeship.com/projects/f0842f50-b2ab-0134-db15-5a75b35ed8ee/status?branch=master)](https://app.codeship.com/projects/193330)

# Download it!

[ ![Download](https://api.bintray.com/packages/time4tea/py-hole/py-hole/images/download.svg) ](https://bintray.com/time4tea/py-hole/py-hole/_latestVersion)




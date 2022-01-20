# Py-Hole

py-hole is a network-level ad blocker, that blocks ads for your whole home or business network!

This is a small thing inspired by pi-hole, unfortunately the installation
of pi-hole did too many things for me, so I wanted the same thing, but less
complicated. You could check out pi-hole too - it may be just the right thing for you.

py-hole uses dnsmasq for its DNS resolution capabilities.

# Thanks

Thanks to the pi-hole project for much awesome work and inspiration

# No warranty / No implied warranty or suitability

This program comes with no warranty, we don't even imply that it is fit for the purpose of blocking ads.

The program uses lists of domains on the internet that the user can configure.

# Install It!

This software is beta quality. It has been used on a number of small networks for many years with no issues. 

```
curl -L https://packagecloud.io/time4tea/py-hole/gpgkey | sudo apt-key add -
echo "deb https://packagecloud.io/time4tea/py-hole/any/ any main" | sudo tee /etc/apt/sources.list.d/time4tea_py-hole.list
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

If it is working, it should print something like:

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

### More information on configuration

You'll need to make sure that dnsmasq is set up how you want it. This will vary according to your own needs. Here are 
some configuration snippets. You'll probably need to set up the server.conf file below, at a minimum.

#### /etc/dnsmasq.d/server.conf
```text
# use these servers as main resolvers
server=208.67.222.222
server=208.67.220.220
```

#### /etc/dnsmasq.d/localdomain.conf
```text
# file cotaining names of hosts on the local network
addn-hosts=/etc/hosts.mine

# Set this (and domain: see below) if you want to have a domain
# automatically added to simple names in a hosts-file.
expand-hosts

# Set the domain for dnsmasq. this is optional, but if it is set, it
# does the following things.
# 1) Allows DHCP hosts to have fully qualified domain names, as long
#     as the domain part matches this setting.
# 2) Sets the "domain" DHCP option thereby potentially setting the
#    domain of all systems configured by DHCP
# 3) Provides the domain part for "expand-hosts"
domain=mydomain.net
```

dnsmasq can be configured to be the DHCP server for you network, which has some benefits.

#### /etc/dnsmasq.d/dhcp.con
````text
domain=mydomain.net
local=/mydomain.net/

dhcp-option=option:router,192.168.0.1

dhcp-range=192.168.0.50,192.168.0.240,12h

# fixed ips
dhcp-host=aa:aa:aa:aa:aa:aa,somehost,192.168.0.x,24h
dhcp-host=bb:bb:bb:bb:bb:bb,anotherhost,192.168.0.y,24h
````

## Notes for ubuntu

Ubuntu comes with the horrible systemd. You might be able to get it to stop by doing the following (seems to work on LTS 20)

```shell
sudo systemctl disable systemd-resolved
sudo systemctl stop systemd-resolved
```

and then edit `/etc/resolv.conf` to be

`
nameserver 127.0.0.1
`

# Report It!

If you've got feedback, please tell me at the github issues page:

https://github.com/time4tea-net/py-hole/issues

# Tweet It!

[ Yes! ](https://twitter.com/intent/tweet/?text=py-hole+is+an+awesome+network+level+ad+blocker&url=https%3A%2F%2Fgithub.com%2Ftime4tea-net%2Fpy-hole)

# Build Status

[![Build and Deploy](https://github.com/time4tea-net/py-hole/actions/workflows/continuous-integration.yml/badge.svg)](https://github.com/time4tea-net/py-hole/actions/workflows/continuous-integration.yml)

# Download it!

https://packagecloud.io/time4tea/py-hole


# Installing on OpenWRT Routers

You can install this on an OpenWRT router to give yourself a break from malware and ads...

It's a bit manual, but perhaps somebody can package this in the OpenWrt style?

- It requires that your have python3 installed, and are using dnsmasq.

- Clone the repo
- Run `./build-tar.sh`  - this will build `py-hole-SNAPSHOT.tar.gz`
- Copy this to your open wrt server, and log in to it
- run `tar zxf <filename> -C /`
- run `cat /tmp/pyhole-example-crontab.txt` and copy the lines
- run `crontab -e` and insert the lines you copied
- Go to the "Network/DHCP & DNS" in the UI and add "Additional Hosts file" of "/var/lib/py-hole/blackhole.list"




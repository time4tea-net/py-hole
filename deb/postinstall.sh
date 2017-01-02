#!/bin/bash

set -e

/opt/py-hole/py-hole 2>&1 >> /var/log/py-hole.log

service dnsmasq restart



#!/bin/bash

set -e

/opt/py-hole/py-hole >> /var/log/py-hole.log 2>&1

service dnsmasq restart



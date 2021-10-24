#!/bin/bash

set -u
set -e

rm -rf target

mkdir -p target/distributions

echo "Building version '$VERSION'"

fpm -t deb -s dir -n py-hole -v ${VERSION} \
    --license GPLv3 \
    --architecture all \
    --vendor "time4tea technology" \
    --maintainer "pyhole@time4tea.net" \
    --url "https://github.com/time4tea.net/pyhole" \
    --description "A Small Alternative to pi-hole, in python" \
    --depends python3 \
    --depends python3-requests \
    --depends dnsmasq \
    --package target/distributions \
    --post-install deb/postinstall.sh \
    --pre-uninstall deb/preuninstall.sh \
    --post-uninstall deb/postuninstall.sh \
    src/=/opt/py-hole/ \
    conf/=/etc/py-hole/ \
    var/=/var/lib/py-hole/ \
    cron.d/py-hole.cron=/etc/cron.d/py-hole \
    dnsmasq.d/=/etc/dnsmasq.d/


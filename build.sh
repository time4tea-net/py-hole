#!/bin/bash

set -u
set -e

rm -rf target

mkdir -p target/distributions

fpm -t deb -s dir -n py-hole -v ${VERSION} \
    --license GPLv3 \
    --architecture any \
    --vendor "time4tea technology" \
    --maintainer "pyhole@time4tea.net" \
    --url "https://github.com/time4tea.net/pyhole" \
    --description "A Small Alternative to pi-hole, in python" \
    --depends python2.7 \
    --depends python-requests \
    --depends dnsmasq \
    --package target/distributions \
    --post-install deb/postinstall.sh \
    --pre-uninstall deb/preuninstall.sh \
    --post-uninstall deb/postuninstall.sh \
    src/=/opt/py-hole/ \
    conf/=/etc/py-hole/ \
    cron.d/=/etc/cron.d/ \
    dnsmasq.d/=/etc/dnsmasq.d/


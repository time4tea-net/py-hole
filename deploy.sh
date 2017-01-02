#!/usr/bin/env bash

set -u
set -e
set -x

curl -T target/distributions/py-hole_${VERSION}_any.deb -utime4tea:${BINTRAY_API_KEY} https://api.bintray.com/content/time4tea/py-hole/py-hole/${VERSION}/pool/main/p/py-hole/py-hole_${VERSION}_any.deb\;deb_distribution=time4tea\;deb_component=free\;deb_architecture=any
#!/usr/bin/env bash

set -u
set -e

curl -T target/distributions/py-hole_${VERSION}_any.deb -H "X-GPG-PASSPHRASE: ${BINTRAY_GPG_PASSPHRASE}" -utime4tea:${BINTRAY_API_KEY} https://api.bintray.com/content/time4tea/py-hole/py-hole/${VERSION}/pool/main/p/py-hole/py-hole_${VERSION}_any.deb\;deb_distribution=time4tea\;deb_component=free\;deb_architecture=any\;publish=1

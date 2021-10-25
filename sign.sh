#!/bin/bash

echo version ${VERSION:?not set}

KEYID=7EC6BC48A8F76477

echo "Signing with $KEYID"

. ./set-version.sh

debsigs --sign=origin -k $KEYID target/distributions/py-hole_${VERSION}_all.deb


#!/bin/bash


KEYID=7EC6BC48A8F76477

. ./set-version.sh

echo version ${VERSION:?not set}

echo "Signing with $KEYID"

debsigs --sign=origin -k $KEYID target/distributions/py-hole_${VERSION}_all.deb


#!/bin/bash

set -u
set -e

rm -rf target

mkdir -p target/tarfile

VERSION=SNAPSHOT

echo "Building version '${VERSION:?not set}'"

BUILDROOT=target/tarfile/$VERSION

mkdir -p $BUILDROOT/bin $BUILDROOT/tmp $BUILDROOT/etc/py-hole $BUILDROOT/var/lib/py-hole

cp src/py-hole $BUILDROOT/bin
chmod a+x $BUILDROOT/bin/*

cp conf/* $BUILDROOT/etc/py-hole

cat cron.d/py-hole.cron | sed -e s/root// | sed -e 's#/opt/py-hole#/bin#' | sed -e 's/#.*//' > $BUILDROOT/tmp/pyhole-example-crontab.txt

tar czf target/py-hole-${VERSION}.tar.gz -C $BUILDROOT --owner 0 --group 0  .



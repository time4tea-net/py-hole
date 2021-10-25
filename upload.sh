#!/bin/bash

. ./set-version.sh

echo version ${VERSION:?not set}

set -x

packagecloud_push time4tea/pyhole/any/any target/distributions/py-hole_${VERSION}_all.deb
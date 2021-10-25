#!/bin/bash

. ./set-version.sh

echo version ${VERSION:?not set}

set -x

package_cloud push time4tea/py-hole/any/any target/distributions/py-hole_${VERSION}_all.deb
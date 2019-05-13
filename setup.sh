#!/bin/sh
. $(dirname $0)/path.sh
test -z $BUILD_DIR && exit 127

if [ -f "$DATA_DIR/${PACKAGE}_${VERSION_BASE}.orig.tar.gz" ]; then :; else
  echo "Error: $DATA_DIR/${PACKAGE}_${VERSION_BASE}.orig.tar.gz not found"
  exit 127
fi

rm -rf $BUILD_DIR
set -x

mkdir -p $(dirname $BUILD_DIR)
cd $(dirname $BUILD_DIR)
cp -p $DATA_DIR/${PACKAGE}_${VERSION_BASE}.orig.tar.gz .
tar zxf ${PACKAGE}_${VERSION_BASE}.orig.tar.gz
if test $(lsb_release -c -s) = "stretch"; then
  cp -frp $SCRIPT_DIR/debian $BUILD_DIR
else
  cp -frp $SCRIPT_DIR/debian8 $BUILD_DIR/debian
fi

cd $BUILD_DIR
sudo apt-get update
sudo apt-get -y upgrade
dpkg-checkbuilddeps 2>&1 | sed 's/dpkg-checkbuilddeps.*dependencies: //' | xargs sudo apt-get -y install

#!/bin/bash

RETCODE=$(fw_exists ${IROOT}/zephir.installed)
[ ! "$RETCODE" == 0 ] || { \
  source $IROOT/zephir.installed
  return 0; }

ZEPHIR=$IROOT/zephir

cd $IROOT
git clone https://github.com/phalcon/zephir
cd $ZEPHIR
git checkout ba061614452f7b44a0ff6a85031f6b17f386ebd1
./install

cp $ZEPHIR/parser/modules/zephir_parser.so $PHP_HOME/lib/php/extensions/no-debug-non-zts-20151012/zephir_parser.so

echo "export ZEPHIR_HOME=${IROOT}/zephir/bin/zephir" > $IROOT/zephir.installed

source $IROOT/zephir.installed

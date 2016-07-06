#!/bin/bash

fw_depends php7 zephir

RETCODE=$(fw_exists ${IROOT}/phalcon.installed)
[ ! "$RETCODE" == 0 ] || { \
  source $IROOT/phalcon.installed
  return 0; }

# Enable the PHP phalcon extension
sed -i 's|;extension=phalcon.so|extension=phalcon.so|g' $PHP_HOME/lib/php.ini

git clone http://github.com/phalcon/cphalcon
cd cphalcon
git checkout 9c66927d02a04bfa87f0a6517a761744e376df42 # v2.0.13
${ZEPHIR_HOME} build --backend=ZendEngine3

echo "" > $IROOT/phalcon.installed

source $IROOT/phalcon.installed

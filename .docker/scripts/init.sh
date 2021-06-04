#!/usr/bin/env sh
##
# Initialise CKAN instance.
#
set -e

CKAN_USER_NAME="${CKAN_USER_NAME:-admin}"
CKAN_USER_PASSWORD="${CKAN_USER_PASSWORD:-Password123!}"
CKAN_USER_EMAIL="${CKAN_USER_EMAIL:-admin@localhost}"

cd $SRC_DIR/ckan \
  && paster db clean -c $CKAN_INI \
  && paster db init -c $CKAN_INI
  && paster --plugin=ckan user add "${CKAN_USER_NAME}" email="${CKAN_USER_EMAIL}" password="${CKAN_USER_PASSWORD}" -c $CKAN_INI \
  && paster --plugin=ckan sysadmin add "${CKAN_USER_NAME}" -c $CKAN_INI

# Create some base test data
. $SRC_DIR/app/scripts/create-test-data.sh

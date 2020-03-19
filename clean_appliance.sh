#!/bin/bash

# Stop and disable services
systemctl stop evmserverd
systemctl disable evmserverd

systemctl stop $APPLIANCE_PG_SERVICE
systemctl disable $APPLIANCE_PG_SERVICE

# Remove auto-generated files
pushd /var/www/miq/vmdb
  rm -f REGION GUID certs/* config/database.yml
popd

# Remove database
pushd $APPLIANCE_PG_DATA
  rm -rf ./*
popd

# cat /etc/repmgr.conf
# su - postgres
# repmgr -f /etc/repmgr.conf cluster show
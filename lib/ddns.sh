#!/bin/bash

if [ -z "$AUTH" ]; then
  echo "\$AUTH is not set"
  exit 1
fi
if [ -z "$ACCOUNT_ID" ]; then
  echo "\$ACCOUNT_ID is not set"
  exit 1
fi
if [ -z "$ZONE_ID" ]; then
  echo "\$ZONE_ID is not set"
  exit 1
fi
if [ -z "$RECORD_ID" ]; then
  echo "\$RECORD_ID is not set"
  exit 1
fi

CURRENT_IP=`curl --ipv4 -s http://icanhazip.com/`
TTL=60

touch $WORKDIR/.latest_ip
LATEST_IP=`cat $WORKDIR/.latest_ip`

if [ "$CURRENT_IP" = "$LATEST_IP" ]; then
  echo "SAME"
else
  echo "SAVING NEW..."
  echo $CURRENT_IP > $WORKDIR/.latest_ip
  curl -u "$AUTH" \
       -H "Content-Type: application/json" \
       -H "Accept: application/json" \
       -X "PATCH" \
       -i "https://api.dnsimple.com/v2/$ACCOUNT_ID/zones/$ZONE_ID/records/$RECORD_ID" \
       -d "{\"content\":\"$CURRENT_IP\",\"ttl\":$TTL}"
fi
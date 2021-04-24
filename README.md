# dnsimple-ddns

Lightweight Docker container, built on top of the `alpine` image, that checks your public IP every 15m and updates a record on dnsimple if it has changed.

## Dnsimple API Authentication

Currently, the only supported api authentication is simple auth with dnsimple email:password. OAuth support coming soon (feel free to send a PR)

## Configuring Container

To use the container you will need to provide 4 ENV variables:

### AUTH

`AUTH` contains the `email:password` combination for your dnsimple account

Example: `AUTH="example@email.com:mySecretPassword"`

### ACCOUNT_ID

`ACCOUNT_ID` contains the id for your dnsimple account.

This can be found by clicking on account in the dnsimple dashboard and looking in the URL for the account id.

Example: `ACCOUNT_ID=12345`

### ZONE_ID

`ZONE_ID` contains the domain name for the record you are changing.

Example: `ZONE_ID=example.com`

### RECORD_ID

`RECORD_ID` contains the id for the record you wish to set.

This can be found by clicking on edit for the record in the dnsimple dashboard and looking in the URL for the record id.

Example: `RECORD_ID=12345678`

## Docker Compose Example

```
version: "3.1"

services:
  ddns:
    image: "benwyrosdick/dnsimple-ddns"
    environment:
      AUTH: "example@email.com:mySecretPassword"
      ACCOUNT_ID: 12345
      ZONE_ID: "example.com"
      RECORD_ID: 12345678
```
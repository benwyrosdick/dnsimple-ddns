# dnsimple-ddns

Lightweight Docker container, built on top of the `alpine` image, that checks your public IP every 15m and updates a record on dnsimple if it has changed.

## Dnsimple API Authentication

Currently, the only supported api authentication is simple auth with dnsimple email:password. OAuth support coming ~~soon~~ eventually (feel free to send a PR)

## Configuring Container

To use the container you will need to provide 4 ENV variables:

### AUTH

`AUTH` contains the `email:password` combination for your dnsimple account

Example: `AUTH="example@email.com:mySecretPassword"`

### ACCOUNT_ID

`ACCOUNT_ID` contains the id for your dnsimple account.

This can be found by clicking on account in the dnsimple dashboard and looking in the URL for the account id.

![Screenshot 2021-04-24 163726](https://user-images.githubusercontent.com/1733/115973640-34e4a880-a51c-11eb-8d7c-4bb32757d6b6.png)

Example: `ACCOUNT_ID=12345`

### ZONE_ID

`ZONE_ID` contains the domain name for the record you are changing.

Example: `ZONE_ID=example.com`

### RECORD_ID

`RECORD_ID` contains the id for the record you wish to set.

This can be found by clicking on edit for the record in the dnsimple dashboard and looking in the URL for the record id.

![Screenshot 2021-04-24 164745](https://user-images.githubusercontent.com/1733/115973715-d7049080-a51c-11eb-8e60-3d071ce8dcc8.png)

Example: `RECORD_ID=12345678`

## Docker Compose Example

Here is an example `docker-compose.yml` file:

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

Then you can start the process in the background:

```
docker compose up -d ddns
```
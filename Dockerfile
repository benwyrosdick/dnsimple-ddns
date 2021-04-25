FROM alpine

ENV WORKDIR=/dnsimple
WORKDIR ${WORKDIR}
RUN apk update && apk add bash curl
COPY ./lib $WORKDIR
COPY  ./lib/ddns.sh /etc/periodic/15min/ddns
CMD [ "crond", "-l", "2", "-f" ]
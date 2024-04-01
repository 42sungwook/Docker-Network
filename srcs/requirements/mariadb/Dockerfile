FROM alpine:3.18

RUN apk update && \
    apk add --no-cache mariadb mariadb-client

COPY ./conf/my.cnf /etc/mysql/my.cnf

COPY ./tools/start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
FROM alpine:3.18

RUN apk update && \
    apk add --no-cache mariadb mariadb-client dumb-init

COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./tools/start.sh /start.sh

EXPOSE 3306

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "./start.sh"]

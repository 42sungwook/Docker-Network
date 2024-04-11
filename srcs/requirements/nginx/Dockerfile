FROM alpine:3.18

RUN apk update && \
    apk add --no-cache nginx openssl dumb-init

COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf
COPY ./tools/start.sh .

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "start.sh"]

#docker build -t nginx .
#docker run --name [name] -d -p 80:80 nginx
#docker stop [name]
#docker rm [name]

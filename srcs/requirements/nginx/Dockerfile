FROM alpine:3.18

RUN apk -U update && \
		rm -rf /var/cache/apk/* && \
		apk add --no-cache nginx openssl dumb-init

COPY ./conf/default.conf /etc/nginx/http.d/default.conf
COPY ./tools/start.sh .

EXPOSE 443

ENTRYPOINT ["/usr/bin/dumb-init", "--"]
CMD ["sh", "start.sh"]

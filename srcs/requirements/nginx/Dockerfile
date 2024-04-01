FROM alpine:3.18

RUN apk update \
    && apk add --no-cache nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

#docker build -t nginx .
#docker run --name [name] -d -p 80:80 nginx
#docker stop [name]
#docker rm [name]
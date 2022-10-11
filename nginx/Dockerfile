FROM alpine:latest

RUN apk update && apk add nginx
COPY default.conf /usr/share/nginx/default.conf

EXPOSE 3080/tcp

CMD ["nginx", "-c", "/usr/share/nginx/default.conf", "-g", "daemon off;"]

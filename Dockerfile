#
# postfix
#
FROM        alpine:3.6
LABEL       vendor="jack6.liu"
COPY        etc/main.cf /main.cf
RUN         apk update &&                   \
            apk --no-cache add postfix &&   \
            rm -f /etc/postfix/main.cf &&   \
            mv /main.cf /etc/postfix/ &&    \
            rm -rf /var/cache/apk/*
EXPOSE      25
ENTRYPOINT  ["postfix", "start"]
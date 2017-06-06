#
# postfix
#
FROM        alpine:3.6
LABEL       vendor="jack6.liu"
COPY        script/start_postfix.sh /usr/bin/
RUN         apk update &&                                 \
            apk --no-cache add bash postfix rsyslog &&    \
            chmod +x /usr/bin/start_postfix.sh &&         \
            rm -rf /var/cache/apk/*
EXPOSE      25
ENTRYPOINT  ["/usr/bin/start_postfix.sh"]
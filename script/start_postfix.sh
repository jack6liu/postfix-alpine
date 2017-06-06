#!/bin/bash

#
# configure rsyslogd
# only enable message and maillog
#
sed -e 's:/var/log/secure:-/var/log/secure:g' \
    -e 's:/var/log/boot.log:-/var/log/boot.log:g' \
    -e 's:-/var/log/maillog:/var/log/maillog:g'   \
    -i /etc/rsyslog.conf

#
# configure postfix
#
postconf -e myorigin=\$mydomain
postconf -e mydestination=
postconf -e mynetworks_style=subnet
postconf -e mynetworks=127.0.0.0/8,10.0.0.0/8,172.16.0.0/12,192.168.0.0/16
postconf -e alias_maps=hash:/etc/postfix/aliases
postconf -e alias_database=hash:/etc/postfix/aliases

postconf -e inet_interfaces=all
postconf -e inet_protocols=ipv4
postconf -e default_transport=smtp
postconf -e relay_transport=relay
postconf -e disable_vrfy_command=yes
postconf -e smtpd_helo_required=yes
postconf -e smtputf8_enable=no

# start rsyslogd
rsyslogd
sleep 0.5

# start postfix
postfix start
sleep 0.5

# check log for keep container running
tail -f /var/log/maillog

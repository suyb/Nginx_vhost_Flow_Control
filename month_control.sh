#!/bin/bash
record_path='/var/log/admin_nginx'

#clean the var_hostname1_in var_hostname2_in。
echo 0 >$record_path/hostname1_in.log
echo 0 >$record_path/hostname2_in.log

#copy the normal conf files to Nginx conf and become effective.
\cp -f $record_path/conf/hostname1_normal.conf /usr/local/webserver/nginx/conf/vhost/hostname1.conf
\cp -f $record_path/conf/hostname2_normal.conf /usr/local/webserver/nginx/conf/vhost/hostname2.conf

kill -hup `cat /usr/local/webserver/nginx/logs/nginx.pid`
echo "  " >> /var/log/admin_nginx/report.log
echo "------month_control.sh  is ok.  $(date +%F) $(date +%X------)" >> /var/log/admin_nginx/report.log
echo "  " >> /var/log/admin_nginx/report.log

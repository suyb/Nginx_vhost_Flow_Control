#!/bin/bash
log_path='/var/log/nginx'
to_path='/var/log/admin_nginx/logs'

mv -f $log_path/access_hostname2.log $to_path/access_hostname2.log
mv -f $log_path/access_hostname1.log $to_path/access_hostname1.log
kill -USR1 `cat /usr/local/webserver/nginx/logs/nginx.pid`
echo "------cut_Nginx_log.shcut_Nginx_log.sh is ok.  $(date +%F) $(date +%X------)" >> /var/log/admin_nginx/report.log
echo "  " >> /var/log/admin_nginx/report.log

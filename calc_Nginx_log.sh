#!/bin/bash
#You must install webalizer.
#just test.

to_path='/var/log/admin_nginx/logs'
bin_path='/usr/local/webserver/webalizer/bin'
record_path='/var/log/admin_nginx'

$bin_path/webalizer $to_path/access_hostname1.log -o $record_path/hostname1/ > /dev/null
$bin_path/webalizer $to_path/access_hostname2.log -o $record_path/hostname2/ > /dev/null
echo "------calc_Nginx_log.sh is ok.  $(date +%F) $(date +%X------)" >> /var/log/admin_nginx/report.log
echo "  " >> /var/log/admin_nginx/report.log 

#!/bin/bash
to_path='/var/log/admin_nginx/logs'
bin_path='/usr/local/webserver/webalizer/bin'
record_path='/var/log/admin_nginx'

#var_hostname1 var_hostname2  --you hostname's daily flow.
#var_hostname1_in  var_hostname2_in   --you hostname's flow in this month .

var_hostname1=`cat /var/log/admin_nginx/hostname1.txt`
var_hostname2=`cat /var/log/admin_nginx/hostname2.txt`
var_hostname1_in=`cat /var/log/admin_nginx/hostname1_in.txt`
var_hostname2_in=`cat /var/log/admin_nginx/hostname2_in.txt`

var_hostname1_in=$(($var_hostname1_in+$var_hostname1))
var_hostname2_in=$(($var_hostname2_in+$var_hostname2))

echo $var_hostname1_in >/var/log/admin_nginx/hostname1_in.txt
echo $var_hostname2_in >/var/log/admin_nginx/hostname2_in.txt

if [ "$var_hostname1_in" -ge 31457280 ]
then 
        \cp -f /var/log/admin_nginx/conf/blog.friend8.net.conf /usr/local/webserver/nginx/conf/vhost/blog.friend8.net.conf
        kill -hup `cat /usr/local/webserver/nginx/logs/nginx.pid`
fi

if [ "$var_hostname2_in" -ge 31457280 ]
then
        \cp -f /var/log/admin_nginx/conf/bbs.veikin.com.conf /usr/local/webserver/nginx/conf/vhost/bbs.veikin.com.conf
        kill -hup `cat /usr/local/webserver/nginx/logs/nginx.pid`
fi
echo "------control.sh  is ok.  $(date +%F) $(date +%X------)" >> /var/log/admin_nginx/report.log
echo "  " >> /var/log/admin_nginx/report.log

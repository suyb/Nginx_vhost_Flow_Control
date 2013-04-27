#!/bin/bash
run_path='/var/log/admin_nginx'

$run_path/cut_Nginx_log.sh 
$run_path/calc_Nginx_log.sh
$run_path/record.sh
$run_path/control.sh
echo "------daily_control.sh  is ok.  $(date +%F) $(date +%X------)" >> /var/log/admin_nginx/report.log
echo "  " >> /var/log/admin_nginx/report.log    

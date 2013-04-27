#!/bin/bash
record_path='/var/log/admin_nginx'

#grep the every hostname’s flow and record.

cat $record_path/hostname1/index.html |tail -24 |head -1 |cut -c51- |sed 's/<\/FONT><\/TH>//' >   $record_path/hostname1.txt
cat $record_path/hostname2/index.html |tail -24 |head -1 |cut -c51- |sed 's/<\/FONT><\/TH>//' >   $record_path/hostname2.txt
rm -f $record_path/hostname1/*
rm -f $record_path/hostname2/*
echo "------record.sh is ok.  $(date +%F) $(date +%X------)" >> /var/log/admin_nginx/report.log
echo "  " >> /var/log/admin_nginx/report.log

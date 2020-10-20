#!/bin/sh

#make folder for storing all kind of logs
mkdir /path/logs

#now store overall summary of system
aureport > /path/logs/summary

#status of all services running
service --status-all > /path/logs/status

#enter logs directory
cd /var/log

#now storing all errors present using keywords
cat syslog | grep 'warning\|failed\|error\|critical' > /path/logs/syslogs
cat auth.log | grep 'authentication failure\|user NOT in sudoers\|warning\|lock\|warning\|failed\|error' > /path/logs/yauthlogs
cat mail.log | grep 'authorization failure\|lock\|warning\|failed\|error' > /path/logs/mailLogs
journalctl _SYSTEMD_UNIT=sshd.service | grep 'error\|warning\|failed'  > /path/logs/sshLogs
cat /usr/local/cpanel/logs/access_log | grep 'warning\|failed\|error\|critical' > /path/logs/acessLogs
cat /usr/local/cpanel/logs/error_log | grep 'warning\|failed\|error\|critical' > /path/logs/errorLogs

#now compress the folder 
tar czf /path/logs.tar.gz /path/logs

#delete logs file
rm -r /path/logs

#Finally send the mail
echo -e "Hi admin,\nFind error logs generated in attached file." | mailx  -s "Error logs" -A /path/logs.tar.gz admin@xyz.com

#Check if mail is in queue
mailq

#Delete the tar file
rm /path/logs.tar.gz
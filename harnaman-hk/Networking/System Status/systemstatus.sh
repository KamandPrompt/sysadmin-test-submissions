#!/bin/bash
FILE=servicelogs
receiver_email=username@domain.com
common_warns=(
    fail
    denied
    segfault
    segmentation
    rejected
    warn
)
auth_checks=(
  failed
  "user not in sudoers"
  unlocked
)
echo -e "Services Status\n" > $FILE
echo "+ indicates the service is running" >> $FILE 
echo "- indicates the service is stopped" >> $FILE
service --status-all >> $FILE

echo -e  "\n\nError Logs\n" >> $FILE
if [ -f "/var/log/apache2/error.log" ]; then
  cat /var/log/apache2/error.log >> $FILE 
fi

echo -e "\nUser Activity\n" >> $FILE
if [ -f "/var/log/auth.log" ]; then
  for keyword in "${auth_checks[@]}"; do
    grep -i "$keyword" /var/log/auth.log >> "$FILE"
  done
fi

echo -e "\nWARNINGS" >> "$FILE"
if [ -f "/var/log/syslog" ]; then
  for warn in "${common_warns[@]}"; do
    grep -i "$warn" /var/log/syslog >> "$FILE"
  done
fi

mail -s "System Status `$DATE`" receiver_email << servicelogs

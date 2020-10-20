#!/bin/bash
#ver. 1 

##set your email address 
ADMIN="admin@iitmandi.co.in"

##list your services you want to check
SERVICES=(  'nginx' 'apache2', 'http','https' )

#subject of mail
SUBJECT="Daily Update of SNTC Server"

#inital message
MESSAGE="This is the daily update for services running on the server\n\n"
MESSAGE+="Hostname : `hostname`"
MESSAGE+="+------------------------------------------------------------------------------------+\n";
MESSAGE+="STATUS OF ALL SERVICES\n";
MESSAGE+="+------------------------------------------------------------------------------------+\n\n";

#### DO NOT CHANGE anything BELOW ####

 for i in "${SERVICES[@]}"
  do
    ###IF APACHE IS NOT RUNNING####
     if [[ "$(systemctl show -p ActiveState --value $i)" == "active" ]]
    then
        MESSAGE+="$i is ACTIVE\n"
    else
        MESSAGE+="$i is INACTIVE\nLogs for $i - \n\n"
        MESSAGE+="$(tail -10 /var/log/$i/error.log)\n\n"
    fi
  done

MESSAGE+="+------------------------------------------------------------------------------------+\n"
MESSAGE+="SUSPICIOUS ACTIVITY\n"
MESSAGE+="+------------------------------------------------------------------------------------+\n\n"

#check logs for failed login attempts
MESSAGE+="$(grep -i "`date --date='yesterday' '+%b %e'`" /var/log/messages | egrep -e 'fail')\n\n"

MESSAGE+="+------------------------------------------------------------------------------------+\n"
MESSAGE+="SYSTEM WARNINGS\n"
MESSAGE+="+------------------------------------------------------------------------------------+\n\n"

#check logs for warnings/errors/critical errors
MESSAGE+="$(grep -i "`date --date='yesterday' '+%b %e'`" /var/log/messages | egrep -wi 'warning|error|critical')\n\n"

#mail it to admin
mail -s "$SUBJECT" "$ADMIN" < $MESSAGE
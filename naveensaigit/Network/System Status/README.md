## Code explanation
1. `ADMIN` is the email address of the admin.
2. `SERVICES` is a list of all the services to be checked.
3. `MESSAGE` is the body of the mail and `SUBJECT` is the subject of the mail.
4. For all services - 
    * Check if the status is active
        * If active, add status as "ACTIVE".
        * Else, add "INACTIVE" and add the error logs for that service.
5. Check the logs for failed attempts to login for "Suspicious Activity" and add them to `MESSAGE`.
6. Check the logs for errors/warnings/critical errors for "System Warnings" and add them to `MESSAGE`.
7. Use the mail command to send the mail. Note that the mailutils and postfix must be configured beforehand.

## Steps to run the code
1. Make the script executable by running `chmod +x <path_to_script>/check_status.sh`.
2. Add a cronjob to execute the script everyday at 00:01 Hrs  
    ```
    1 0 * * * /usr/bin/sh/ <path_to_script>/check_status.sh
    ```
Note: Cron must be installed on the system

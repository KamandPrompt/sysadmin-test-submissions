# CHANGES TO RUN FOR YOUR SERVER
Insert email address and password from which you want to send mail in the following code in script.py:
```python
    s.login("sender_email_id", "sender_email_password")
```
Also update sender and reciepent email id in another line:
```python
    s.sendmail("sender_email_id", "admin_email_id", message)
```
You can also customize the message accordingly.

# How to RUN the script
Simply go the directory in which file is stored and run
```
python script.py
```
Now you will recieve daily updates at midnight of server status

# Approach and Learnings
1. I used schedule librrary to repeat function "job" at midnight
2. requests library to get request from iitmandi.co.in
3. I used SMTP to send email updates

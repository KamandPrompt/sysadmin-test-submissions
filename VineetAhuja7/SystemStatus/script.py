import schedule
import time
import smtplib 
import requests

def job(t):
	s = smtplib.SMTP('smtp.gmail.com', 587)
	s.ehlo()
	s.starttls() 
	 
	s.login("sender_email_id", "sender_email_password")
	response = requests.get("https://iitmandi.co.in")
	TEXT  = str(response)  
	SUBJECT="Daily Service Status"
	message = 'Subject: {}\n\n{}'.format(SUBJECT, TEXT)
	s.sendmail("sender_email_id", "admin_email_id", message) 

	s.quit() 
	return

schedule.every().day.at("00:00").do(job,'It is 00:00')

while True:
    schedule.run_pending()
    time.sleep(60) 


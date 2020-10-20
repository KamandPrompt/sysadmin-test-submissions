## Question 1

Alas, I didn't got much time to do!

- But here is my ideas I will use the TaskSchedular library in Python `pip3 install TaskScheduler`
- Then, I will write the script which will run the command Docker logs and will fetch the logs of the application in the container.
- Then In the script I will check for codes of 4xx range error codes and send an email accoridingly.
- I will check if some IP adress has continuesly made a request to the server, then I will also send an email regarding that. As we can see in the **link** http://mandifunker.pythonanywhere.com/
- Accordingly we can check for errors logs in that and finally report that.

## Question 2

Using the whois command, I found where the domain belongs and also using the website whois.domaintools.com
```
whois iitmandi.ac.in
```

It belongs to **ERNET India** wihth IANA ID 800068, URL: http://www.ernet.in
Name servers
- NS1.IITMANDI.NET.IN (has 1 domains)
- NS2.IITMANDI.NET.IN (has 1 domains)

## Question 3

I used the Ubuntu system to install the nmap command.
```
nmap -p 1-2000 iitmandi.co.in | grep open
```

The open sockets are 4
```
22/tcp   open     ssh
53/tcp   open     domain
80/tcp   open     http
443/tcp  open     https
```

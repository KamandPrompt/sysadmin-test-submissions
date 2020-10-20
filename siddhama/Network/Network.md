# Task - 1 - Script to send mail to admin
- ### Resources used:
  - [https://stackify.com/linux-logs/](https://stackify.com/linux-logs/) for learning about different kind of logs.
  - [This](https://stackoverflow.com/questions/34753831/execute-a-shell-script-everyday-at-specific-time/34754109) solution at stackoverflow.com for automating the script.
  - [This](https://devops.ionos.com/tutorials/configure-a-postfix-relay-through-gmail-on-centos-7/) tutorial on devops.ionos.com for installing and configuring Postfix.
- ### Things I learnt :
  I came to know about different kinds of logs generated on system and also what inferences we can draw from them. Also, I came across new things like Postfix, relays, mail servers. I got to know more about SMTP and learnt to set up MTA. 
- ### How I did it?
  I used Postfix for sending mails. Postfix is **M**ail **T**ransfer **A**gent (MTA) used to send and recieve mails. It implements a first layer of defense against spambots and malware. Besides this, it can be easlily combined with other software spam/virus filtering, message store access or complex SMTP-level access-policies.

  I didn't have any domain registered, so I configured Postfix as a relay through Gmail.

  I followed blog on devops.ionos.com for setting up postfix and configuring it for Gmail. 
  But things were not much easy while setting-up the service,  Gmail will see it as suspicious behaviour and refuse to authenticate. I saw that my IP address was in blacklist for sending gmail in this manner. After lot of googling and reading blogs I was able resolve all issues. I needed to configure my Gmail account to allow less secure apps for sending mails. Also I needed two factor authentication on gmail, otherwise my mail would have ended up in spam section.  

  The script for sending mails is present in [mailScript.sh](mailScript.sh).

  At last, the following command ensure that given script runs at every midnight( 23:59:00) without need of intervention.
  ```
   sudo crontab -e
   59 23 * * * /path_to_script/mailScript.sh
  ```
<br><br><br>

# Task - 2 -
- First I tried using whois command on terminal but it gave timout. For google.com it worked correctly. I got a line in generated log during this saying that *The Registry database contains ONLY .COM, .NET, .EDU domains and
Registrars.*
- So, I switched to alternate methods and got a site [https://www.registry.in/](https://www.registry.in/) for Indian domains. On searching for iitmandi.ac.in domain I got the registrar. I'm showing first few lines of the info generated there-


    ```
    Domain Name: iitmandi.ac.in
    Registry Domain ID: D4020030-IN
    Registrar WHOIS Server:
    Registrar URL: http://www.ernet.in
    Updated Date: 2020-03-18T10:09:09Z
    Creation Date: 2010-02-02T10:09:08Z
    Registry Expiry Date: 2021-02-02T10:09:08Z
    Registrar: ERNET India
    Registrar IANA ID: 800068
    Registrar Abuse Contact Email:
    Registrar Abuse Contact Phone:
    Domain Status: ok http://www.icann.org/epp#OK
    Registrant Organization: IIT MANDI
    Registrant State/Province: Himachal Pradesh
    Registrant Country: IN
    ```
**So,Registrar who provided domain is : ERNET India**

Besides, all other details about registrar, registrant, admin and tech were also present. 
<br><br><br>


# Task - 3 - Finding open Ports b/w (1-2000)
### Command : 
> nmap -p 1-2000 iitmandi.co.in


### Output log generated:
```
Starting Nmap 7.60 ( https://nmap.org ) at 2020-09-12 01:00 IST

Nmap scan report for iitmandi.co.in (14.139.34.11)
Host is up (0.31s latency).
Not shown: 1990 closed ports
PORT         STATE    SERVICE
22/tcp       open     ssh
25/tcp       filtered smtp
53/tcp       open     domain
80/tcp       open     http
137/tcp      filtered netbios-ns
138/tcp      filtered netbios-dgm
139/tcp      filtered netbios-ssn
443/tcp      open     https
445/tcp      filtered microsoft-ds
1434/tcp     filtered ms-sql-m

Nmap done: 1 IP address (1 host up) scanned in 21.76 seconds
```
# Networking Answers

## Problem 1
Problem 1 is a very simple network scan problem. Over a range of IP addresses, we need to find the open ports and any other information we could have our hands on.

`nmap` is a very powerful and versatile security scanner, and it is the right tool for the above problem. With `nmap`, you can find the IP addresses which are up and running, their open ports, OS version, and much more. `nmap` also provides the flexibility of script scanning which can deal with methods like bypassing authentication credentials, exploiting vulnerability, and much more.

I have used `nmap` for solving the problem. There are many details which you could get with a `nmap` scan, but I chose to go with the `-A` option or the Aggressive Scan option, which gave me the following additional information about the IP addresses -
1. **Service and Version Detection** - This helps to know the service running on the port - information about it's service protocol (eg, FTP, SSH, etc.), the application name, the version number, etc.
2. **OS detection** - This helps determine the operating system of the remote host.
3. **Script scanning** - This allows scripts to be used while scanning for automated network tasks.
4. **Traceroute**

Hence, let's just stop the theory here, and get down to the results of the test.

The following results are done on 31st January 2018, 22:38 IST. Results may vary at any other time.

```
$ nmap -A 14.139.34.0/24
```
```
Starting Nmap 7.01 ( https://nmap.org ) at 2018-01-31 22:38 IST
Nmap scan report for 14.139.34.2
Host is up (0.047s latency).
Not shown: 987 closed ports
PORT      STATE    SERVICE      VERSION
22/tcp    open     ssh          OpenSSH 6.6p1 Ubuntu 2ubuntu1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   1024 6a:04:05:a7:e6:54:02:d6:b5:e0:ea:0f:be:62:c7:e4 (DSA)
|   2048 6c:a7:f9:89:f3:a0:70:4e:bb:6d:40:2e:67:fb:86:b9 (RSA)
|_  256 65:f6:1c:f0:c9:2e:6f:e7:de:43:b8:1c:52:ab:43:04 (ECDSA)
53/tcp    open     domain
| dns-nsid:
|_  bind.version: 9.9.5-3ubuntu0.6-Ubuntu
80/tcp    open     http         Apache httpd 2.4.7 ((Ubuntu))
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
139/tcp   filtered netbios-ssn
443/tcp   open     ssl/http     Apache httpd 2.4.7 ((Ubuntu))
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: IIT Mandi|VPN Access
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
445/tcp   filtered microsoft-ds
1434/tcp  filtered ms-sql-m
3000/tcp  open     ntop-http    Ntop web interface 5.0.1
5001/tcp  open     ssh          OpenSSH 7.2p2 Ubuntu 4ubuntu2.4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   2048 8f:fe:72:c6:29:af:a1:b1:b1:38:c5:17:5d:e8:75:00 (RSA)
|_  256 30:b5:28:55:d5:51:22:c3:c3:8e:48:6c:36:8c:54:06 (ECDSA)
7001/tcp  open     ssh          OpenSSH 6.0p1 Debian 4+deb7u2 (protocol 2.0)
| ssh-hostkey:
|   1024 48:51:85:e6:c0:2b:38:98:8a:0d:01:f4:13:e6:0c:00 (DSA)
|   2048 77:d3:25:da:63:64:c0:53:30:c6:da:ee:71:52:b9:b4 (RSA)
|_  256 ba:dd:66:bf:e7:9b:05:13:fe:b2:4a:6b:e1:88:ea:44 (ECDSA)
9000/tcp  filtered cslistener
9001/tcp  filtered tor-orport
10000/tcp open     http         MiniServ 1.690 (Webmin httpd)
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for mail.students.iitmandi.ac.in (14.139.34.3)
Host is up (0.044s latency).
Not shown: 983 filtered ports
PORT      STATE  SERVICE       VERSION
25/tcp    open   smtp          Postfix smtpd
|_smtp-commands: mail.students.iitmandi.ac.in, PIPELINING, SIZE 10485760, VRFY, ETRN, STARTTLS, AUTH PLAIN LOGIN, ENHANCEDSTATUSCODES, 8BITMIME, DSN, SMTPUTF8,
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
53/tcp    open   domain        ISC BIND 9.10.3-P4-Ubuntu
| dns-nsid:
|_  bind.version: 9.10.3-P4-Ubuntu
80/tcp    open   http          Apache httpd 2.4.18 ((Ubuntu))
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Students
110/tcp   open   pop3          Dovecot pop3d
|_pop3-capabilities: RESP-CODES UIDL STLS AUTH-RESP-CODE USER TOP CAPA PIPELINING SASL(PLAIN LOGIN)
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
143/tcp   open   imap          Dovecot imapd
|_imap-capabilities: SASL-IR post-login IMAP4rev1 capabilities more ENABLE LITERAL+ AUTH=PLAIN Pre-login STARTTLS AUTH=LOGINA0001 IDLE OK have listed ID LOGIN-REFERRALS
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
389/tcp   closed ldap
443/tcp   open   ssl/http      Apache httpd 2.4.18 ((Ubuntu))
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Students
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
465/tcp   open   ssl/smtp      Postfix smtpd
|_smtp-commands: mail.students.iitmandi.ac.in, PIPELINING, SIZE 10485760, VRFY, ETRN, AUTH PLAIN LOGIN, ENHANCEDSTATUSCODES, 8BITMIME, DSN, SMTPUTF8,
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
587/tcp   closed submission
993/tcp   open   ssl/imap      Dovecot imapd
|_imap-capabilities: more SASL-IR have post-login ENABLE IMAP4rev1 ID Pre-login listed AUTH=LOGINA0001 IDLE OK capabilities AUTH=PLAIN LITERAL+ LOGIN-REFERRALS
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
995/tcp   open   ssl/pop3      Dovecot pop3d
|_pop3-capabilities: SASL(PLAIN LOGIN) USER AUTH-RESP-CODE CAPA TOP RESP-CODES PIPELINING UIDL
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
2046/tcp  closed sdfunc
2718/tcp  closed pn-requester2
3306/tcp  closed mysql
5000/tcp  closed upnp
8000/tcp  closed http-alt
10000/tcp open   http          MiniServ 1.850 (Webmin httpd)
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).

Nmap scan report for 14.139.34.4
Host is up (0.044s latency).
Not shown: 992 closed ports
PORT     STATE    SERVICE      VERSION
22/tcp   open     ssh          OpenSSH 6.6.1p1 Ubuntu 2ubuntu2.6 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   1024 7d:c3:f1:16:c5:6a:6f:56:7e:9e:db:c4:45:d6:bf:72 (DSA)
|   2048 7f:4e:74:07:37:07:31:1f:e1:e6:e5:26:f2:94:93:ed (RSA)
|_  256 b4:08:1e:28:28:91:b5:b1:de:4a:61:a4:14:87:1a:0f (ECDSA)
25/tcp   open     smtp         Postfix smtpd
|_smtp-commands: Library.localdomain, PIPELINING, SIZE 10240000, VRFY, ETRN, ENHANCEDSTATUSCODES, 8BITMIME, DSN,
80/tcp   open     http         Apache httpd 2.4.7 ((Ubuntu))
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: Library-IIT Mandi
139/tcp  filtered netbios-ssn
445/tcp  filtered microsoft-ds
1434/tcp filtered ms-sql-m
6001/tcp open     X11:1?
|_x11-access: ERROR: Script execution failed (use -d to debug)
8080/tcp open     http         Apache httpd 2.4.7 ((Ubuntu))
| http-open-proxy: Potentially OPEN proxy.
|_Methods supported:CONNECTION
|_http-server-header: Apache/2.4.7 (Ubuntu)
|_http-title: Koha &rsaquo;                     Log in to Koha
Service Info: Host:  Library.localdomain; OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 14.139.34.6
Host is up (0.044s latency).
Not shown: 991 filtered ports
PORT     STATE  SERVICE       VERSION
53/tcp   closed domain
80/tcp   open   http          Apache httpd 2.2.22 ((Ubuntu))
|_http-server-header: Apache/2.2.22 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
135/tcp  closed msrpc
143/tcp  closed imap
389/tcp  closed ldap
443/tcp  open   ssl/http      Apache httpd 2.2.22 ((Ubuntu))
|_http-server-header: Apache/2.2.22 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: 2018-01-31T17:47:19+00:00; -4s from scanner time.
3389/tcp closed ms-wbt-server
5900/tcp closed vnc
5901/tcp closed vnc-1

Nmap scan report for mail.alumni.iitmandi.ac.in (14.139.34.7)
Host is up (0.045s latency).
Not shown: 986 closed ports
PORT      STATE    SERVICE      VERSION
22/tcp    open     ssh          OpenSSH 5.9p1 Debian 5ubuntu1.1 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   1024 a8:f4:e8:e0:71:6b:3f:a8:a2:ba:cd:b7:08:db:bc:0a (DSA)
|   2048 dc:94:40:72:1a:56:55:80:ae:2a:a2:e8:d2:59:2b:fd (RSA)
|_  256 9e:ef:25:62:ca:74:9d:3c:cd:09:57:51:77:1f:40:e2 (ECDSA)
25/tcp    open     smtp         Postfix smtpd
|_smtp-commands: mail.alumni.iitmandi.ac.in, PIPELINING, SIZE 10485760, VRFY, ETRN, STARTTLS, AUTH PLAIN LOGIN, AUTH=PLAIN LOGIN, ENHANCEDSTATUSCODES, 8BITMIME, DSN,
| ssl-cert: Subject: commonName=alumni.iitmandi.ac.in/organizationName=IIT Mandi/stateOrProvinceName=HP/countryName=IN
| Not valid before: 2015-03-26T12:31:59
|_Not valid after:  2025-03-23T12:31:59
|_ssl-date: 2018-01-31T17:47:00+00:00; -4s from scanner time.
53/tcp    open     domain       ISC BIND 9.8.1-P1
| dns-nsid:
|_  bind.version: 9.8.1-P1
80/tcp    open     http         Apache httpd 2.2.22 ((Ubuntu))
|_http-server-header: Apache/2.2.22 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
110/tcp   open     pop3         Dovecot pop3d
|_pop3-capabilities: SASL(PLAIN LOGIN) STLS USER CAPA TOP RESP-CODES PIPELINING UIDL
| ssl-cert: Subject: commonName=alumni.iitmandi.ac.in/organizationName=Dovecot mail server
| Not valid before: 2013-09-05T06:01:12
|_Not valid after:  2023-09-05T06:01:12
|_ssl-date: 2018-01-31T17:47:01+00:00; -4s from scanner time.
139/tcp   filtered netbios-ssn
143/tcp   open     imap         Dovecot imapd
|_imap-capabilities: SASL-IR post-login IMAP4rev1 capabilities more ENABLE LITERAL+ AUTH=PLAIN Pre-login STARTTLS AUTH=LOGINA0001 IDLE OK have listed ID LOGIN-REFERRALS
| ssl-cert: Subject: commonName=alumni.iitmandi.ac.in/organizationName=Dovecot mail server
| Not valid before: 2013-09-05T06:01:12
|_Not valid after:  2023-09-05T06:01:12
|_ssl-date: 2018-01-31T17:46:51+00:00; -4s from scanner time.
445/tcp   filtered microsoft-ds
587/tcp   open     smtp         Postfix smtpd
|_smtp-commands: mail.alumni.iitmandi.ac.in, PIPELINING, SIZE 10485760, VRFY, ETRN, STARTTLS, AUTH PLAIN LOGIN, AUTH=PLAIN LOGIN, ENHANCEDSTATUSCODES, 8BITMIME, DSN,
| ssl-cert: Subject: commonName=alumni.iitmandi.ac.in/organizationName=IIT Mandi/stateOrProvinceName=HP/countryName=IN
| Not valid before: 2015-03-26T12:31:59
|_Not valid after:  2025-03-23T12:31:59
|_ssl-date: 2018-01-31T17:46:58+00:00; -4s from scanner time.
993/tcp   open     ssl/imap     Dovecot imapd
|_imap-capabilities: more SASL-IR have post-login ENABLE IMAP4rev1 ID Pre-login listed AUTH=LOGINA0001 IDLE OK capabilities AUTH=PLAIN LITERAL+ LOGIN-REFERRALS
| ssl-cert: Subject: commonName=alumni.iitmandi.ac.in/organizationName=Dovecot mail server
| Not valid before: 2013-09-05T06:01:12
|_Not valid after:  2023-09-05T06:01:12
|_ssl-date: 2018-01-31T17:46:57+00:00; -4s from scanner time.
995/tcp   open     ssl/pop3     Dovecot pop3d
|_pop3-capabilities: SASL(PLAIN LOGIN) USER CAPA TOP RESP-CODES PIPELINING UIDL
| ssl-cert: Subject: commonName=alumni.iitmandi.ac.in/organizationName=Dovecot mail server
| Not valid before: 2013-09-05T06:01:12
|_Not valid after:  2023-09-05T06:01:12
|_ssl-date: 2018-01-31T17:47:24+00:00; -4s from scanner time.
1434/tcp  filtered ms-sql-m
10000/tcp open     ssl/http     MiniServ 1.650 (Webmin httpd)
|_http-server-header: MiniServ/1.650
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).
| ssl-cert: Subject: commonName=*/organizationName=Webmin Webserver on alumni.iitmandi.ac.in
| Not valid before: 2013-09-03T11:13:30
|_Not valid after:  2018-09-02T11:13:30
|_ssl-date: 2018-01-31T17:47:19+00:00; -5s from scanner time.
20000/tcp open     http         MiniServ 1.560 (Webmin httpd)
| http-robots.txt: 1 disallowed entry
|_/
|_http-title: Login to Alumni.iitmandi.ac.in
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 14.139.34.8
Host is up (0.049s latency).
Not shown: 994 filtered ports
PORT      STATE  SERVICE  VERSION
53/tcp    closed domain
80/tcp    open   http     Apache httpd 2.2.22 ((Debian))
|_http-server-header: Apache/2.2.22 (Debian)
|_http-title: Site doesn't have a title (text/html).
389/tcp   open   ldap     OpenLDAP 2.2.X - 2.3.X
443/tcp   open   ssl/http Apache httpd 2.2.22 ((Debian))
|_http-server-header: Apache/2.2.22 (Debian)
|_http-title: Site doesn't have a title (text/html).
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: 2018-01-31T17:46:45+00:00; -5s from scanner time.
3306/tcp  closed mysql
10000/tcp open   http     MiniServ 1.850 (Webmin httpd)
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).

Nmap scan report for mail.projects.iitmandi.ac.in (14.139.34.9)
Host is up (0.046s latency).
Not shown: 989 filtered ports
PORT      STATE  SERVICE    VERSION
25/tcp    open   smtp       Postfix smtpd
|_smtp-commands: mail.projects.iitmandi.ac.in, PIPELINING, SIZE 31457280, VRFY, ETRN, STARTTLS, AUTH PLAIN LOGIN, ENHANCEDSTATUSCODES, 8BITMIME, DSN, SMTPUTF8,
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
53/tcp    closed domain
80/tcp    open   http       Apache httpd 2.4.18 ((Ubuntu))
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
110/tcp   open   pop3       Dovecot pop3d
|_pop3-capabilities: RESP-CODES UIDL STLS AUTH-RESP-CODE USER TOP CAPA PIPELINING SASL(PLAIN LOGIN)
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
143/tcp   open   imap       Dovecot imapd
|_imap-capabilities: SASL-IR post-login IMAP4rev1 capabilities more ENABLE LITERAL+ AUTH=PLAIN Pre-login STARTTLS AUTH=LOGINA0001 IDLE OK have listed ID LOGIN-REFERRALS
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
389/tcp   closed ldap
443/tcp   open   ssl/http   Apache httpd 2.4.18 ((Ubuntu))
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
465/tcp   open   ssl/smtp   Postfix smtpd
|_smtp-commands: mail.projects.iitmandi.ac.in, PIPELINING, SIZE 31457280, VRFY, ETRN, AUTH PLAIN LOGIN, ENHANCEDSTATUSCODES, 8BITMIME, DSN, SMTPUTF8,
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
587/tcp   closed submission
993/tcp   open   ssl/imap   Dovecot imapd
|_imap-capabilities: more SASL-IR have post-login ENABLE IMAP4rev1 ID Pre-login listed AUTH=LOGINA0001 IDLE OK capabilities AUTH=PLAIN LITERAL+ LOGIN-REFERRALS
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
10000/tcp open   http       MiniServ 1.820 (Webmin httpd)
|_http-server-header: MiniServ/1.820
|_http-title: Site doesn't have a title (text/html; Charset=iso-8859-1).

Nmap scan report for 14.139.34.10
Host is up (0.045s latency).
Not shown: 958 filtered ports, 37 closed ports
PORT     STATE SERVICE  VERSION
21/tcp   open  ftp      vsftpd 3.0.3
80/tcp   open  http     Apache httpd 2.4.18 ((Ubuntu))
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
443/tcp  open  ssl/http Apache httpd 2.4.18 ((Ubuntu))
|_http-server-header: Apache/2.4.18 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
| ssl-cert: Subject: commonName=*.iitmandi.ac.in
| Not valid before: 2016-12-05T07:00:00
|_Not valid after:  2019-12-05T07:00:00
|_ssl-date: TLS randomness does not represent time
8000/tcp open  http-alt gunicorn/19.4.5
|_http-open-proxy: Proxy might be redirecting requests
| http-robots.txt: 1 disallowed entry
|_/
|_http-server-header: gunicorn/19.4.5
|_http-title: Did not follow redirect to http://14.139.34.10/accounts/login?next=/
8082/tcp open  http     Octoshape P2P streaming web service
|_http-title: Site doesn't have a title.
1 service unrecognized despite returning data. If you know the service/version, please submit the following fingerprint at https://nmap.org/cgi-bin/submit.cgi?new-service :
SF-Port8000-TCP:V=7.01%I=7%D=1/31%Time=5A72008B%P=x86_64-pc-linux-gnu%r(Ge
SF:nericLines,10A,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nConnection:\x20cl
SF:ose\r\nContent-Type:\x20text/html\r\nContent-Length:\x20173\r\n\r\n<htm
SF:l>\n\x20\x20<head>\n\x20\x20\x20\x20<title>Bad\x20Request</title>\n\x20
SF:\x20</head>\n\x20\x20<body>\n\x20\x20\x20\x20<h1><p>Bad\x20Request</p><
SF:/h1>\n\x20\x20\x20\x20Invalid\x20Request\x20Line\x20'Invalid\x20HTTP\x2
SF:0request\x20line:\x20'''\n\x20\x20</body>\n</html>\n")%r(GetRequest,F9,
SF:"HTTP/1\.0\x20302\x20FOUND\r\nServer:\x20gunicorn/19\.4\.5\r\nDate:\x20
SF:Wed,\x2031\x20Jan\x202018\x2017:44:39\x20GMT\r\nConnection:\x20close\r\
SF:nVary:\x20Accept-Language,\x20Cookie\r\nContent-Type:\x20text/html;\x20
SF:charset=utf-8\r\nLocation:\x20http://0\.0\.0\.0:8000/accounts/login\?ne
SF:xt=/\r\nContent-Language:\x20en\r\n\r\n")%r(FourOhFourRequest,1A1F,"HTT
SF:P/1\.0\x20404\x20NOT\x20FOUND\r\nServer:\x20gunicorn/19\.4\.5\r\nDate:\
SF:x20Wed,\x2031\x20Jan\x202018\x2017:44:44\x20GMT\r\nConnection:\x20close
SF:\r\nVary:\x20Accept-Language,\x20Cookie\r\nContent-Type:\x20text/html;\
SF:x20charset=utf-8\r\nContent-Language:\x20en\r\n\r\n\n\n\n<!DOCTYPE\x20h
SF:tml>\n<html\x20lang=\"en\">\n<head>\n<title>IIT-Mandi-Cloud</title>\n<m
SF:eta\x20http-equiv=\"Content-type\"\x20content=\"text/html\";\x20charset
SF:=utf-8\"\x20/>\n<meta\x20name=\"keywords\"\x20content=\"File\x20Collabo
SF:ration\x20Team\x20Organization\"\x20/>\n\n<meta\x20name=\"viewport\"\x2
SF:0content=\"width=device-width,\x20initial-scale=1,\x20shrink-to-fit=no\
SF:"\x20/>\n\n<link\x20rel=\"icon\"\x20type=\"image/x-icon\"\x20href=\"/me
SF:dia/img/favicon\.png\?t=1487249391\"\x20/>\n<!--\[if\x20IE\]>\n<link\x2
SF:0rel=\"shortcut\x20icon\"\x20href=\"/media/img/favicon\.png\?t=14872493
SF:91\"/>\n<!\[endif\]-->\n<link\x20rel=\"stylesheet\"\x20type=\"text/css\
SF:"\x20href=\"/media/assets/css/bootstrap\.min\.b00faad199b5\.css\"/>\n<l
SF:ink\x20rel=\"stylesheet\"\x20type=\"text/css\"\x20href=\"/media/css/sea
SF:hub\.min\.css\?t=1487249391\"\x20/>\n\n\n</head>\n\n<body>\n\x20\x20\x2
SF:0\x20<div\x20")%r(Socks5,126,"HTTP/1\.1\x20400\x20Bad\x20Request\r\nCon
SF:nection:\x20close\r\nContent-Type:\x20text/html\r\nContent-Length:\x202
SF:01\r\n\r\n<html>\n\x20\x20<head>\n\x20\x20\x20\x20<title>Bad\x20Request
SF:</title>\n\x20\x20</head>\n\x20\x20<body>\n\x20\x20\x20\x20<h1><p>Bad\x
SF:20Request</p></h1>\n\x20\x20\x20\x20Invalid\x20Method\x20'Invalid\x20HT
SF:TP\x20method:\x20'\\x05\\x04\\x00\\x01\\x02\\x80\\x05\\x01\\x00\\x03''\
SF:n\x20\x20</body>\n</html>\n");
Service Info: OS: Unix

Nmap scan report for 14.139.34.11
Host is up (0.045s latency).
Not shown: 991 closed ports
PORT     STATE    SERVICE      VERSION
22/tcp   open     ssh          OpenSSH 7.2p2 Ubuntu 4ubuntu2.4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   2048 5b:ab:3b:5a:f7:f8:d6:14:35:f4:a2:33:23:4c:14:d5 (RSA)
|_  256 da:0d:d4:18:e8:ba:6f:5c:5f:e7:74:d7:43:6a:a5:7d (ECDSA)
53/tcp   open     domain       ISC BIND 9.10.3-P4-Ubuntu
| dns-nsid:
|_  bind.version: 9.10.3-P4-Ubuntu
80/tcp   open     http         nginx 1.10.3 (Ubuntu)
|_http-server-header: nginx/1.10.3 (Ubuntu)
|_http-title: Apache2 Ubuntu Default Page: It works
139/tcp  filtered netbios-ssn
406/tcp  filtered imsp
445/tcp  filtered microsoft-ds
1434/tcp filtered ms-sql-m
2009/tcp filtered news
8080/tcp open     http         Apache httpd 2.4.10 ((Debian))
|_http-open-proxy: Proxy might be redirecting requests
|_http-server-header: Apache/2.4.10 (Debian)
|_http-title: Did not follow redirect to http://sntc.iitmandi.ac.in:8080/index.php/Main_Page
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 14.139.34.17
Host is up (0.056s latency).
Not shown: 993 closed ports
PORT     STATE    SERVICE      VERSION
22/tcp   open     ssh          OpenSSH 5.9p1 Debian 5ubuntu1.4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   1024 67:ff:5b:e6:47:21:2a:fe:11:75:38:97:87:bc:fa:3b (DSA)
|   2048 01:af:06:2f:7b:d9:11:5f:9a:38:05:63:dd:cd:0d:b1 (RSA)
|_  256 29:d2:ce:a2:28:38:ce:0a:6a:0b:62:b5:f4:64:c8:08 (ECDSA)
80/tcp   open     http         Apache httpd 2.2.22 ((Ubuntu))
|_http-server-header: Apache/2.2.22 (Ubuntu)
|_http-title: Site doesn't have a title (text/html).
139/tcp  filtered netbios-ssn
445/tcp  filtered microsoft-ds
1434/tcp filtered ms-sql-m
5800/tcp open     vnc-http     x11vnc
|_http-title: File Not Found
5900/tcp open     vnc          VNC (protocol 3.7)
| vnc-info:
|   Protocol version: 3.7
|   Security types:
|     TLS (18)
|_    VNC Authentication (2)
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Nmap scan report for 14.139.34.24
Host is up (0.044s latency).
Not shown: 974 closed ports
PORT      STATE    SERVICE            VERSION
80/tcp    open     http               Microsoft IIS httpd 8.5
| http-methods:
|_  Potentially risky methods: TRACE
|_http-server-header: Microsoft-IIS/8.5
|_http-title: OAS
135/tcp   open     msrpc              Microsoft Windows RPC
139/tcp   filtered netbios-ssn
445/tcp   filtered microsoft-ds
1023/tcp  open     remoting           MS .NET Remoting services
1024/tcp  open     remoting           MS .NET Remoting services
1433/tcp  open     ms-sql-s           Microsoft SQL Server 2014 12.00.5000.00; SP1+
1434/tcp  filtered ms-sql-m
1801/tcp  open     msmq?
2103/tcp  open     msrpc              Microsoft Windows RPC
2105/tcp  open     msrpc              Microsoft Windows RPC
2107/tcp  open     msrpc              Microsoft Windows RPC
2383/tcp  open     ms-olap4?
3001/tcp  open     http               Mongrel httpd 1.1.5
|_http-server-header: Mongrel 1.1.5
|_http-title: Site doesn't have a title.
3306/tcp  open     mysql              MySQL (unauthorized)
3389/tcp  open     ssl/ms-wbt-server?
| ssl-cert: Subject: commonName=WIN-3HQ4OAGKOI8
| Not valid before: 2017-11-05T22:49:38
|_Not valid after:  2018-05-07T22:49:38
|_ssl-date: 2018-01-31T17:49:16+00:00; +2m15s from scanner time.
3690/tcp  open     svnserve           Subversion
8080/tcp  open     http               Apache httpd
| http-methods:
|_  Potentially risky methods: TRACE
|_http-open-proxy: Proxy might be redirecting requests
|_http-server-header: Apache
|_http-title: BitNami Redmine Stack
8085/tcp  open     remoting           MS .NET Remoting services
8086/tcp  open     remoting           MS .NET Remoting services
49152/tcp open     msrpc              Microsoft Windows RPC
49153/tcp open     msrpc              Microsoft Windows RPC
49154/tcp open     msrpc              Microsoft Windows RPC
49155/tcp open     msrpc              Microsoft Windows RPC
49156/tcp open     msrpc              Microsoft Windows RPC
49157/tcp open     msrpc              Microsoft Windows RPC
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
| ms-sql-info:
|   14.139.34.24:1433:
|     Version:
|       Post-SP patches applied: true
|       Service pack level: SP1
|       Product: Microsoft SQL Server 2014
|       name: Microsoft SQL Server 2014 SP1+
|       number: 12.00.5000.00
|_    TCP port: 1433

Nmap scan report for 14.139.34.26
Host is up (0.044s latency).
Not shown: 979 closed ports
PORT      STATE    SERVICE            VERSION
80/tcp    open     http               Microsoft IIS httpd 8.5
| http-methods:
|_  Potentially risky methods: TRACE
|_http-server-header: Microsoft-IIS/8.5
|_http-title: OAS
135/tcp   open     msrpc              Microsoft Windows RPC
139/tcp   filtered netbios-ssn
445/tcp   filtered microsoft-ds
1023/tcp  open     remoting           MS .NET Remoting services
1433/tcp  open     ms-sql-s           Microsoft SQL Server 2014 12.00.5000.00; SP1+
1434/tcp  filtered ms-sql-m
1801/tcp  open     msmq?
2103/tcp  open     msrpc              Microsoft Windows RPC
2105/tcp  open     msrpc              Microsoft Windows RPC
2107/tcp  open     msrpc              Microsoft Windows RPC
2383/tcp  open     ms-olap4?
3389/tcp  open     ssl/ms-wbt-server?
| ssl-cert: Subject: commonName=WIN-IM9ODNNS59R
| Not valid before: 2017-12-02T23:24:06
|_Not valid after:  2018-06-03T23:24:06
|_ssl-date: 2018-01-31T17:45:56+00:00; -1m08s from scanner time.
49152/tcp open     msrpc              Microsoft Windows RPC
49153/tcp open     msrpc              Microsoft Windows RPC
49154/tcp open     msrpc              Microsoft Windows RPC
49155/tcp open     msrpc              Microsoft Windows RPC
49156/tcp open     msrpc              Microsoft Windows RPC
49157/tcp open     msrpc              Microsoft Windows RPC
49158/tcp open     msrpc              Microsoft Windows RPC
49159/tcp open     msrpc              Microsoft Windows RPC
Service Info: OS: Windows; CPE: cpe:/o:microsoft:windows

Host script results:
| ms-sql-info:
|   14.139.34.26:1433:
|     Version:
|       Post-SP patches applied: true
|       Service pack level: SP1
|       Product: Microsoft SQL Server 2014
|       name: Microsoft SQL Server 2014 SP1+
|       number: 12.00.5000.00
|_    TCP port: 1433

Nmap scan report for 14.139.34.43
Host is up (0.047s latency).
Not shown: 994 closed ports
PORT     STATE    SERVICE      VERSION
22/tcp   open     ssh          OpenSSH 5.9p1 Debian 5ubuntu1.4 (Ubuntu Linux; protocol 2.0)
| ssh-hostkey:
|   1024 2b:ce:5c:81:44:33:3a:e2:81:0a:f4:86:56:3e:a5:1a (DSA)
|   2048 92:7a:7c:00:8f:a2:fd:46:b1:7d:56:b7:1d:7c:86:6c (RSA)
|_  256 38:47:2e:f8:48:95:2c:d3:45:13:bd:75:ff:ad:7b:7c (ECDSA)
139/tcp  filtered netbios-ssn
445/tcp  filtered microsoft-ds
1434/tcp filtered ms-sql-m
3306/tcp open     mysql        MySQL 5.5.54-0ubuntu0.12.04.1
| mysql-info:
|   Protocol: 53
|   Version: .5.54-0ubuntu0.12.04.1
|   Thread ID: 63717
|   Capabilities flags: 63487
|   Some Capabilities: Speaks41ProtocolNew, Support41Auth, IgnoreSpaceBeforeParenthesis, SupportsLoadDataLocal, SupportsCompression, LongColumnFlag, DontAllowDatabaseTableColumn, SupportsTransactions, LongPassword, InteractiveClient, ODBCClient, IgnoreSigpipes, FoundRows, Speaks41ProtocolOld, ConnectWithDatabase
|   Status: Autocommit
|_  Salt: SoS4HL&wG:0}G,BI)/O~
8080/tcp open     http         Apache Tomcat/Coyote JSP engine 1.1
| http-methods:
|_  Potentially risky methods: PUT DELETE
|_http-open-proxy: Proxy might be redirecting requests
|_http-server-header: Apache-Coyote/1.1
|_http-title: Apache Tomcat
Service Info: OS: Linux; CPE: cpe:/o:linux:linux_kernel

Service detection performed. Please report any incorrect results at https://nmap.org/submit/ .
Nmap done: 256 IP addresses (13 hosts up) scanned in 263.14 seconds
```

**Note** - Traceroute results are not shown since it requires administrator priviledges. (Running the above command with `sudo` will do the trick.)

## Problem 2

Here, we might have to look for the company from which `students.iitmandi.ac.in` has been bought. But `students.iitmandi.ac.in` is just a sub-domain of `iitmandi.ac.in`. So, it is enough to look for the Registrar of `iitmandi.ac.in`. Such a search is commonly reffered as WhoIS search. WhoIS search is performed by the ICANN, which keeps all the information about the various DNS on the internet. I made the search on <https://whois.net>. There are many others you can use.

**Registrar of `iitmandi.ac.in`** - ERNET India (R9-AFIN)


## Problem 3

It seems that DuckDuckGo does not own any data centre, rather, it hosts it's data on Amazon AWS servers. The above can be seen by doing a simple traceroute to `www.duckduckgo.com`. Simply type
```
$ sudo traceroute -I www.duckduckgo.com 64
```
and you will see a list of servers that your computer contacts before getting in touch with the last server, i.e., the target DNS's server. This server in my case was `ec2-46-51-218-82.ap-southeast-1.compute.amazonaws.com` which is located in Singapore. Thus, I would like to conclude that DuckDuckGo does not own any data centres of it's own.
# Networking

## 1. Script to send mail about status

These are the following resources I used to come up with my solution -
* https://discuss.tutorialdba.com/1058/shell-script-email-service-apache
* https://beginlinux.com/sec_train_m/sec_secure/777-logs_checks
* https://www.2daygeek.com/linux-bash-script-to-monitor-messages-log-warning-error-critical-send-email/
* https://unix.stackexchange.com/questions/396630/the-proper-way-to-test-if-a-service-is-running-in-a-script

The `README.md` in `System Status` folder contains info about the code. 

## 2. Find out where the domain students.iitmandi.ac.in was bought
The domain students.iitmandi.ac.in was bought on mumbaihosting.com. The following steps describe how I found this - 
1. To find out where the domain was bought, we need to know the DNS records for the domain.
2. I went to the website [Who.is](https://www.who.is/dns/) and entered the domain.
3. I went through DNS records of the domain on [this page](https://www.who.is/dns/students.iitmandi.ac.in/).
4. I searched for DNS record types and found out that the record of type SOA (Start of Authority) contains information about the domain administrator.
5. Thus, I concluded that the domain was bought on mumbaihosting.com.

## 3. Scan all open ports between ports 1-2000 on [SNTC Server](https://www.iitmandi.co.in/) using [Nmap](https://nmap.org/)
I used the following steps to find the answer - 
1. To scan ports using nmap, we need the IP Address of the website. 
2. Again, I used [Who.is](https://www.who.is/dns/) and found out that the IP is 14.139.34.11.
3. Install nmap using `sudo apt-get install nmap`.
4. I used the command `nmap -p 1-2000 14.139.34.11` to scan all ports between 1-2000. I got this command from [NMap Cheat Sheet](https://hackertarget.com/nmap-cheatsheet-a-quick-reference-guide/).

The following ports are all open/filtered (between 1-2000). A filtered port is a port where Nmap can't figure out whether it is an open port or not. [Click here](https://nmap.org/book/man-port-scanning-basics.html) for more details 

PORT     | STATE    | SERVICE
---------|----------|--------
22/tcp   | open     | ssh
53/tcp   | open     | domain
80/tcp   | open     | http
135/tcp  | filtered | msrpc
137/tcp  | filtered | netbios-ns
138/tcp  | filtered | netbios-dgm
139/tcp  | filtered | netbios-ssn
443/tcp  | open     | https
445/tcp  | filtered | microsoft-ds
1022/tcp | filtered | exp2
1023/tcp | filtered | netvenuechat
1026/tcp | filtered | LSA-or-nterm
1434/tcp | filtered | ms-sql-m
1485/tcp | filtered | lansource
1568/tcp | filtered | tsspmap

In addition, here's the list of all open ports on the SNTC server - 

PORT      | STATE | SERVICE
----------|-------|--------
22/tcp    | open  | ssh
53/tcp    | open  | domain
80/tcp    | open  | http
443/tcp   | open  | https
2377/tcp  | open  | swarm
3000/tcp  | open  | ppp
3080/tcp  | open  | stm_pproc
6900/tcp  | open  | rtimeviewer
7946/tcp  | open  | unknown
8000/tcp  | open  | http-alt
8002/tcp  | open  | teradataordbms
8003/tcp  | open  | mcreport
8004/tcp  | open  | p2pevolvenet
8005/tcp  | open  | mxi
9090/tcp  | open  | zeus-admin
24000/tcp | open  | med-ltp
24003/tcp | open  | med-supp
24004/tcp | open  | med-ovw
24005/tcp | open  | med-ci
24008/tcp | open  | unknown
24009/tcp | open  | unknown

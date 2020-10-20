# TASK 1: SCRIPT
The script and readme for script is present in SYSTEMSTATUS folder
# TASK 2 : DOMAIN COMPANY
I used http://whois.domaintools.com/ to find domain registrar for http://students.iitmandi.ac.in/
##### Registrar
```
ERNET India
IANA ID: 800068
URL: http://www.ernet.in
```
# TASK 3 :
1. I used nmap as suggested to find open ports
2. Install nmap as following in ubuntu.
    ```
    sudo apt install nmap
    ```
3. Run nmap to find open ports
    ```
    nmap -p 1-2000 iitmandi.co.in
    ```
4. It will scan and give following results:
    ```
    Host is up (0.032s latency).
    Not shown: 1989 closed ports
    PORT     STATE    SERVICE
    22/tcp   open     ssh
    53/tcp   open     domain
    67/tcp   filtered dhcps
    68/tcp   filtered dhcpc
    80/tcp   open     http
    137/tcp  filtered netbios-ns
    138/tcp  filtered netbios-dgm
    139/tcp  filtered netbios-ssn
    443/tcp  open     https
    445/tcp  filtered microsoft-ds
    1434/tcp filtered ms-sql-m
    ```
    So there are 4 open ports, 7 filtered and 1989 closed ports in first 1-2000 ports

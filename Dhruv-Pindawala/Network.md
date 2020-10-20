# NETWORKING

## problem statement 1
For the desired operation, we will take the following steps:
We are going to use crontab. Execute the followiing steps in the terminal.
1. `crontab-e`, it will open the crontb file of the user in the text ediitor.
2. `MAILTO = 'admin@example.com'` `0 0 * * * netstat; service --status-all` `0 0 * * * cat <locations of the files we need to see daily separated by a space>` : Add these three lines in the file opened in the text editor using ctrl+o, enter, ctrll+x. admin@example.com is the receipent email address. The files, which i would like to see are `var/log/daemon.log` `var/log/syslog` `var/log/apache2/error.log` `/var/log/nginx/error.log` `var/log/rkhunter.log`, more fills can be viewed depending on the sysadmin's requirement. When talking about our SNTC server, we have nginx, for which I have mentioned the /nginx/error.log file.
rkhunter.log file mentioned above is for detecting backdoors and stuffs which can be used to identify any malicious activity/user.
For detection of malicious activities or user, we can even deploy an IDS (intrusion detection system). Many opensource IDS are present in the market and they are reliable. Ex: [Snort](https://www.snort.org/), [Suricata](https://suricata-ids.org/), [Open DLP](https://code.google.com/archive/p/opendlp/)
We can also deploy honeydrive, a honeypot, which can all be used o detect cyber attack.
Irrespective of the IDS/honeypot we used, we can share the output file of the IDS/hooneypot on a daily basis using crontab. For this, `0 0 * * * cat <output file location of the IDS/honeypot>`, add this line in the crontab file we opened earlier. Steps for the same are mentioned above.
In this way, we have fulfilled all the requests demanded by the systemadmin.
Rather then creating a script, I decided to use built in utility and pre-tested softwares to avoid any kind of vulnerabilities.
What I learnt: The basis of the cron utility and how it actually work, and earned a more in depth knowledge of IDS

## problem statement 2
Registrar : ERNET India, their IANA ID : 800068, URL : http://www.ernet.in
Source/Tool : https://whois.domaintools.com
Have used this tool in past for reconanice (was introduced to it in a cybersecurity workshop along with other reconaince tools)

## problem statement 3
Direct ans.(ports: 1-2000) : 22/tcp , 53/tcp , 80/tcp , 443/tcp
IP collection : dig iitmandi.co.in
Command : nmap -v -A -T4 -p1-2000 14.139.34.11

### Extra informatio
#### 22/tcp Version: OpenSSH 7.6p1
Vulnerability : CVE-2018-15919; CWE ID: 200; Authentication: Not Required; Access: Remote
Exploit repo(many other exploits exists): sriramoffcl/OpenSSH-7.6p1-Exploit-py- (github)

#### 53/tcp Version: ISC BIND 9.11.3
Vulnerabilities : CVE-2019-6468, CVE-2019-6471

#### 80/tcp and 443/tcp Version: ngnix 1.14.0
Vulnerabilities : CVE-2018-16845, CVE-2018-16844, CVE-2018-168843

## Note
More vulnerablities can be present coresponding to the above mentioned port versions.
Regarding vulnerabilities, you can contact me or cross verify these vulnerabilities from the internet, ex.: https://www.cvedetails.com, https://cve.mire.org
CVE = Common Vulnerabilities Enumeration, CWE = Common Weaknesses Enumeration
I am not sure if these vulnerabilities are patched or not or our SNTC server as I was not having the permission(authorisation) to do the vulnerability check.
A majority of the vulnerabilities can be exploited either by using metasploit framework(inbuilt exploits are used) or nexpose(third party exploits can also be used).
Using the auxiliary modules of the metasploit framework, we can collect even more information related to the server.
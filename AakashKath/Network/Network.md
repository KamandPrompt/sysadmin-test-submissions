Problem 1:
	All open ports of all machines
	nmap -sT -p- 192.168.1.0/24			#-sT for TCP port scan
	#to bypass firewall
	nmap --script=firewalk --traceroute -p- 192.168.1.0/24
	OS Detection of all machines
	nmap -A 192.168.1.0/24			#192.168.1.0 is to be replaced by network address
	#OS fingerprinting can be done with Xprobe2 as well
	#avahi can be used to scan for all connections on the network
	avahi-browse -rt _workstation._tcp

Problem 2:
	ERNET India (R9-AFIN)
	https://www.whois.com/whois/iitmandi.ac.in
	https://registry.in/whois/iitmandi.ac.in
	https://www.bigrock.in/domain.php

Problem 3:
	DuckDuckGo does not own any data center. They use Amazon's AWS service.
	https://duck.co/forum/thread/3496/hosted-by-amazon
	http://www.gabrielweinberg.com/blog/2009/03/duck-duck-go-architecture.html
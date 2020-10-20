# Task-1 - Setting up a vpn with [Streisand](https://github.com/StreisandEffect/streisand)
 - Resourses used : 
    - AWS Docs - to become familiar with usage of AWS.
    - Streisand installation details on it's github [repo](https://github.com/StreisandEffect/streisand)
    - [Tutorial](https://www.liquidvpn.com/free-streisand-vpn/) on liquidvpn.com for setting up user on AWS.
 - Things learnt :
    - I have very brief idea about virtul server, but doing this task was a kind of hands-on experience.
    - I learnt how to create a VPN.
    - I came to know about various things like gpg, keyserver, ssl/tls encryption, ssl certificates.
    - It also tested my googling and querying skills.
 - How I did it ?
    1. First I created an account on AWS, then i created a user for purpose of VPN with the help of [tutorial](https://www.liquidvpn.com/free-streisand-vpn/) given on liquidvpn.com.
    2. Then, for  installing streisand I followed whatever the instructions were given on github page of streisand. But I ran into two errors while installing it.
       > ERROR 1: hkps://gpg.mozilla.org\ngpg: keyserver refresh failed: General error. 
   
       I found that same issue was discusssed on repo, so i found a fix from there and it worked. I had to change given "streisand_gpg_keyserver_address" to "hkp://pgp.mit.edu:80"<br><br>


       > ERROR 2: "censored": "the output has been hidden due to the fact that 'no_log: true' was specified for this result". 
   
       For looking into logs I converted 'no_log:false' and found out issue was due to key authentication from OpneVPN side. I looked for possible fixes on github repo and google, but problem was that this issue was not fixed even in github repo. After lot of googling, i could not find any way to resolve this problem.

       So I tried custom installation and skipped the OpenVPN plugin when asked, rest of plugins like OpenSSH, OpenConnect/ Cisco AnyConnect, Shadowshocks, WireGuard did not cause any problem and were installed correctly.
    3. Rest of installation was fine and it took about 20 minutes to complete the installation. After the intallation all files for setting up VPN on machine were auto created in local repo, with username and password. For rest details about setting up VPN jump to [VPNSetup.md](VPNSetup.md).

<br><br><br>
# Task - 2 - Prevent hacker from gaining superuser access
1. First of all my instant action would be to disconnect the SSH session  of user69, as chances are most that he would be trying to get root access by any malicious script or decryption software. To disconnect the session we need to know the PID of user69. Use the following command to get PID of user69 .
   > ps faux | grep sshd

   It will show output like this:
   ```
   root 18257 0.0 0.0 84032 3904 ? Ss 06:23 0:00 \_ sshd: user69@pts/2
   ```
   Here 18257 is PID we are looking for. Use following command to kill the session:
    > kill -9 18257
2. My second action would be to change the password of user69 otherwise hacker may get access again.
   As a root user change the password using "passwd user69" and type new password on prompt.
3. But still it would not close all the doors, what if he hacked through SSH key authentication, so we need to change that also. It will be present at */home/user69/.ssh/authorized_keys* . We need to rename or remove the *.ssh/* directory to prevent further entry.
4. So we are done with closing the doors of re-entry. Next thing to be analyzed what havoc he has done till now. We can't jump into server and configure it to get something. Modifying any part of a server with administrative access may cause services to fail or the system itself to become unbootable. Remember that anything wrong with service 'A' will affect millions of users there. 
   So have to look into logs to know for vulnerabilities and scripts. Here three tools come handy for manual analysis,namely **find**, **grep** and **stat**.<br> 
   - *find* alongwith -ctime flag can be used to find files changed within givem timeframe. <br>
   - *grep* can be used to find errors with keywords like 'error','warning','authorization failed','permission denied',etc. <br>
   - *stat* can be used to check status and info like permissions, last access, last changed, modified alongwith UID of whoever did that action.<br>
  
   Besides, this there are other automated tools present like scalp, LOGalyze, Glogg, GoAccess which are there to make life easier.
1. **Possible practises to avoid future attacks** : We can ensure small things like changing password regularly, passwords with mix of special characters,numerals and different cases, looking through the logs and analyzing unexpected memeory or CPU usage if happened. 
   
## References :
- [https://ubuntu.com/server/docs/security-users](https://ubuntu.com/server/docs/security-users)
- [https://mediatemple.net/community/products/dv/204405434/how-to-uncover-malicious-code-malware-files](https://mediatemple.net/community/products/dv/204405434/how-to-uncover-malicious-code-malware-files)

# Administration

## Question-1

I used Google's Compute Engine as my IaaS provider because I am quite familiar with how it authenticates and implements Service accounts(required for the builder, which is going to be my desktop).

I built the vpn-server as follows.

   * First I installed all the dependencies from the Streisand docs. Then I cloned the repository onto my desktop( didn't really go for a remote server as a builder, since I have Linux installed).
   ```
      5  sudo apt update && sudo apt install git python-pip -y

      6  git clone https://github.com/StreisandEffect/streisand.git && cd streisand

      7  ./util/venv-dependencies.sh ./venv

      8  sudo apt-get install python3-pip python3-openssl python3-dev python3-setuptools python3-venv python-cffi libffi-dev libssl-dev libcurl4-openssl-dev

      9  ./util/venv-dependencies.sh ./venv

      10  source ./venv/bin/activate
   ```
   * Once in the python virtual environment having all the dependencies installed, I ran the streisand file from the cloned repository.
   ```
      ./streisand
   ```

   * Now I was asked to create a service account on the google platform and provide a service.json file. I created the service key on the platform (in the API and Services section) and downloaded the corresponding .json file.
  
   * Then I was prompted to enter a 'fully qualified domain' for the vpn-server, for which I used the subdomain - vpn.divyasheel.com , before doing this I set the A-record for this sub-domain on the google platform and linked it to the newly created vpn-server.
  
**After entering the domain I experienced some issues.
The series of fatal errors that I got were something like this->**
1. ```
   TASK [gpg : Refresh the Streisand GPG keyring with keyserver information] ******
   fatal: [128.199.142.41]: FAILED! =>........something bla bla
   PLAY RECAP *********************************************************************
   128.199.142.41             : ok=31   changed=22   unreachable=0    failed=1    skipped=13   rescued=0    ignored=0   
   localhost                  : ok=13   changed=4    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   

   ```
   * I went onto to the github repository of 'streisand' to look for fixes and found that the author suggested changing (just a workaround,not a fix) the line 89(in my local repos, it was 88) to 
      ```when: False.``` So I made these changes and it worked!

   * I had to start the process all over again,which involved deleting the previously built server and the corresponding A-record.
   

2. ```
   Error when installing OpenVPN by Streisand:
   failed: [localhost] (item=None) => {"censored": "the output has been hidden due to the fact that 'no_log: true' was specified for this result", "changed": false}
   fatal: [localhost]: FAILED! => {"censored": "the output has been hidden due to the fact that 'no_log: true' was specified for this result", "changed": false}
   ```
   * This error really took me some time to  figure out but was finally fixed by updating the OpenVPN signing keys as suggested in a pull request by **"lvlohammadii"**.

   * I again had to start over the process right from the beginning, and this time it worked.

After tackling with all these errors, I did receive some errors but none of them halted the installation process and were simply skipped.
At the end I received this summary.
```
PLAY RECAP ******************************************************************************
34.126.125.129             : ok=332  changed=270  unreachable=0    failed=0    skipped=110  rescued=2    ignored=1   
localhost                  : ok=25   changed=3    unreachable=0    failed=0    skipped=1    rescued=0    ignored=0   
```

Finally the setup ended creating the directory 'genereated-docs' inside the cloned repo.

This directory consisted of 4 .html files( primarily 2).
* vpn-server.html consisted of the user and password required for accessing the website(instructions for using) hosted on the vpn-server.
* vpn-server-firewall-information.html consists of information listing all the open ports on the newly created server.

![](./images/generated_docs.png)


## Question-2

* First we need to lock this **user69** by our root account. 
  ```bash
  usermod -L user69
   ```
  >NOTE -> this will only prevent subsequent login attempts by changing the account specific hash in /etc/shadow but won't interrupt any ongoing session.

* If we've not yet started backing up our data then that is something we need to immediately work on(but be careful not to include scripts and other malware from the attacker account).

* Before destroying this account we need to collect information about the previous activity of this account. This will help us understand the attack vector of the hacker.
   * The most obvious place to look first would be **.<bash, python,zsh>_history** files in the home directory. We need to store its content.
   ```bash
   cat /home/user69/.bash_history >> file
   ```
   * We also need to copy the contents of files like **.bashrc / .bash_profile, .profile** and **.bash_login** as they initiate the shell and can be useful in studying the attack later.
   * We need to study the processes initiated by the attacker account by using the command **ps** and store them.
      ```bash
      ps -a -u user69  >> file
      ```
   * Now we need to note all the files created by the attacker( don't copy them ), this can be done by storing the output of the command
      ```bash
      find / -user user69  >> file
      ```
   > NOTE - Only access these file for investigation on an isolated-expendable machine. Copy these files with caution as this could be a part of the attack. 
   
   * Also, note the **public and private ssh-key fingerprint** for this user and remove it from the authorized_keys in all the connected machines. 
      ```bash
      ssh-keygen -lf /home/user69/.ssh/id_rsa >> file

      ssh-keygen -lf /home/user69/.ssh/id_rsa.pub >> file

      ```
   * We also need to get rid of all the cron tabs created by this user, but store them first.
 
* Next we need to configure our firewall to suspend all expendable outgoing process by disabling the ports. This is done to avoid any misuse of the server if compromised.

   ```bash
   sudo ufw default deny outgoing

   sudo ufw allow out <important ports>
   ```
   We also need to reconsider our firewall for incoming ports. (make sure that this doesn't interfere with our application A)

### Now we need to begin removing the user and files associated with this user.
 * First, find and kill all running processes linked with user69
   ```bash
   killall -9 -u user69
   ```
* Now we delete the user account and the files linked with it.
  ```bash
   deluser --remove-home user69    # for debian
   ```


* There are certain sites that provide information about vulnerabilities in a specific version of the OS or a kernel. These vulnerability can be exploited to gain vertical privilege . Therefore we need to find these vulnerabilities before the attacker and safeguard them.
  
   To do this we need to feed our OS info like kernel version and distribution to sites like-(don't reveal any info specific to your personal machine)
   * www.cvedetails.com
   * packetstormsecurity.org/files/cve/[CVE]
   * cve.mitre.org/cgi-bin/cvename.cgi?name=[CVE]
   * www.vulnview.com/cve-details.php?cvename=[CVE] 

* Reduce the amount of access of privileged individuals to the least possible and enable two-factor authentication on all access points.
  
* Closely monitor all the logs of the remaining privileged users to find any suspicious activity, such as brute force logins attempts in auth.logs and possibly find the source of the attack.
  
## What did I Learn?
* lets encrypt
* google cloud compute engine
* linus system administration
* how does a vpn work.
* creating a simple firewall using **ufw**
* importance of auth log in linux
* **scp** command to transfer files from a server.
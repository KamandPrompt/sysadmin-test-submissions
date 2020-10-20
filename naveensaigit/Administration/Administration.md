# Administration

## 1. Setting up your own VPN

I have used DigitalOcean to set up my VPN. I followed [this](https://crosstalksolutions.com/create-your-own-personal-vpn-proxy-with-streisand/) guide to complete the procedure, with a few changes.

1. I set up an account on DigitalOcean and created a droplet.
2. Then, I logged into it and cloned the Streisand github repo.
3. Installed all dependancies and completed the procedure with 2 changes - 
    * Change the line 89 of streisand/playbooks/roles/gpg/tasks/main.yml to when: False
    * Update the OpenVPN key at streisand/playbooks/roles/openvpn/files/openvpn_signing.key and
      streisand/playbooks/roles/test-client/files/openvpn_signing.key
4. Follow the setup procedure as indicated in VPNSetup.md to use the VPN.

Doing this, I understood how a VPN works and how it suceeds in hiding our true location helping us to browse the internet safely and privately!

## 2. Hacker Scenario

In my opinion, the best way to secure the server from the hacker would be to immediately stop the service 'B'. Delete `user69` from the server to prevent further damage. Then, take a backup of the service 'A' just in case the hacker has gained root access on the server. Once this is done, find out how the hacker got in through 'B'. It might be a PHP file having some malicious code or something else. Immediately remove this file. Then, check thoroughly if 'A' has been compromised. Hopefully, 'A' remains secure. Then, the problem is solved. DO NOT restart 'B' unless you fix all the vulnerabilities. To be on the safe side, it might be better never to put it back on the same server. You can use another hobby server so there's no risk! Also, to be completely sure, you can go for a complete reinstall of the server using backups. Inform the users about the maintenance and plan ahead in time to minimize the downtime.
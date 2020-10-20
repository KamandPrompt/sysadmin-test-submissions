
# Question 1

## How I solved the problem?
In this section, I will document the exact steps I took to create the server.
1. Create a builder server droplet in DigitalOcean
2. Logging into the builder server using PuTTy (SSH Client for Windows)
3. Generate an ssh key pair using "ssh-keygen"
4. Copy the contents of the public key, and add those contents in my digitalocean account under "Settings/Security/Add SSH Keys"
5. Install git , python and python-venv on my builder server
6. Clone the git repository : https://github.com/lvlohammadii/streisand (This repo is 3 commits ahead of the original streisand repository, and fixes some bugs)
7. Install the dependencies, create and activate the virtual environment.
8. Run the streisand code, select digitalocean for the vpn server, followed the steps such as "selecting name for server", "adding my personal access token", "adding name of the ssh public key I created earlier in digitalocean". The server was created and I got the ip of my server.
9. I also had acquired a free domain name - pranshu-vpn.tk, which I used to add to the server.
10. Add the domain in newly created droplet in digitalocean, and configured the digitalocean name servers with the domain provider. Then I added an A record 'www' which pointed to my ip in DigitalOcean
11. Next step was to submit "www.pranshu-vpn.tk" in the streisand script, and let it continue.
12. The setup was done, and the vpn was created. I copied the content of my private key, and convert it into ppk format to use with PuTTy. I also connected my builder server with FileZilla FTP, and downloaded the generated-docs folder on my computer.
13. Next step was to destroy the builder droplet.

## Resources used

Leaning about VPN Proxy - [Cross Talk Solutions](https://www.youtube.com/watch?v=UGNVXtSurvQ&t=1019s)

Installation instructions at - [Streisand Github](https://github.com/StreisandEffect/streisand/blob/master/Installation.md)

## What I learnt

1. Accessing remote computers using SSH (PuTTY)

2. Creating a VPN using Streisand

3. Learnt a lot about (Password vs SSH keys, and how SSH keys work, about generating public and private keys, and adding public keys to digitalocean droplets)

4. Using OpenVPN and accessing own VPN

# Question 2

To prevent the hacker from gaining superuser access to my server, I need to disable sudo su command for that particular user.

I found this solution [here](https://www.thegeekdiary.com/how-to-disable-sudo-su-for-users-in-sudoers-configuration-file/)

The solution is to login as the root user, and edit the "/etc/sudoers" file from 
`user69 ALL=(ALL) ALL` to `user69 ALL = ALL, !/bin/su`
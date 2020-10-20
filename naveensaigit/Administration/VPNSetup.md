# VPN Setup

While Streisand allows a variety of ways to use the VPN, I chose to use the "SSH method". The below are the steps to access it on a Linux machine. The steps for other platforms (and Linux) are available in the `generated-docs` directory, but I will be detailing the procedure for Linux below.

## Steps to use the VPN

1. Open the `HomeVPN.html` in `generated-docs` folder.
2. Download the SSL certificate for the server and import it in your browser. I will detail the steps for Chrome. The steps for Firefox are available on the same page

    * Go to settings and search for SSL.
    * Click on the security tab
    * Scroll down and click on Manage Certificates.
    * Click on the Authorities tab and import the downloaded certificate.
    * Select "Trust this certificate for identifying websites" and click Ok.

3. Once that is done, scroll to the last of `HomeVPN.html`. Connect to the gateway https://104.248.231.241 and login using the credentials given
4. Click on SSH. This page contains directions to use the VPN for multiple platforms, but I will go over the ones for Linux.
5. Download the `streisand_rsa` in the Mac/Linux section.
6. Use the terminal to set the correct permissions by running `chmod 600 streisand_rsa`.
7. Move `streisand_rsa` to ~/.ssh folder on your computer and create a config file with content as - 

        Host HomeVPN
        User           forward
        Port           443
        HostName       104.248.231.241
        IdentitiesOnly yes
        IdentityFile   ~/.ssh/streisand_rsa

8. Save this and then run `ssh -vND 8080 forward@HomeVPN` in the terminal.
9. Verify that the fingerprint of the server matches one the following and enter "yes" -

    * `256 SHA256:WXnK4JUTOrZ7UNyIHxumSd+2OpcXg29zYAwsqBX9mvQ root@HomeVPN (ECDSA)`
    * `3072 SHA256:cn+2HB5kzTbFDcY9yvMOGAs1TZZ2Lp5O+M7jFmrAd7Y root@HomeVPN (RSA)`

10. This sets up the SOCKS proxy. Now, to use the VPN, configure the proxy settings as follows on your device - 

    * Go to settings and click on `Network Proxy`
    * Click on `Manual`
    * Enter `127.0.0.1` in the `Socks Host` and set the port to `8080`
    * Exit the settings

11. Now, the VPN should be active! You can check your IP on [whatismyipaddress](https://www.whatismyipaddress.com). It should show the following - 

        ISP:      Digital Ocean
        City:	   North Bergen
        Region:   New Jersey
        Country:	United States

12. To turn off the VPN, close the terminal and disable the proxy.

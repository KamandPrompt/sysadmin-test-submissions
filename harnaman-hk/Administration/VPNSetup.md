# VPN Setup
## Steps to Connect on Android
- We will use these credentials to walk through the process

  `client username`: scene-student
  
  `client password`: hill.burden.grit
- Use this link/url on your device browser to download the ssl certificte(s) :

  https://3.7.141.5/openconnect/scene-student.p12
  
  Open the download and use the `client password` to install the certificates on your device.

- Follow the steps below:
1. Install `Cisco AnyConnect` Application
2. Click OK to accept Supplemental End User License Agreement for AnyConnect Secure Mobility Client vx.x and other VPN-related software
3. (If prompted) Click OK and give necessary app permissions.
4. Open Settings and uncheck Block Untrusted Servers.
5. Click Connections > Add New VPN Connection.
6. Tap Description and enter `streisand`
7. Tap Server Address and enter `3.7.141.5:4443`
8. Tap Advanced Preferences.
9. Tap Certificate.
10. Tap Import and select the client certificate file you had downloaded before.
11. Tap Done twice to save the connection.
12. Tap the back button to return to the main screen. You should see `streisand` in the Connection section.
13. Slide AnyConnect VPN to connect to `streisand`.
14. A Security Warning is displayed. Tap Details.
15. Tap Import and Continue.
16. Tap Connect. Select no group in group selection prompt.
17. In case you are prompted for a username and password at this stage. Please enter `streisand` as username and `coffee.match.hotel.only.short` as password. If there is no such prompt, it is completely fine.
18. Accept the Connection Request.
19. You are now connected to the VPN. You may lookup you IP Address on your device browser, it will be `3.7.141.5`.

## Testing
Successfully connected to my VPN via AnyConnect Application for 

user: immune-initial

password: picnic.mistake.carpet

certificates: https://3.7.141.5/openconnect/immune-initial.p12
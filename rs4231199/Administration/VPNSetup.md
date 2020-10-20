# Steps to connect with my custom vpn
## Android
- Download Cisco AnyConnect from Google Play.
- Launch the application.
- Tap OK to accept the "Supplemental End User License Agreement for AnyConnect® Secure Mobility Client vx.x and other VPN-related Software".
- Tap the menu icon and select Settings.
- Uncheck the Block Untrusted Servers option.
- The server certificate will be imported during the initial login and automatically verified for all future connections.
- Tap the back button.
- Tap Connection and then tap Add New VPN Connection....
- Tap Description and enter `streisand`.
- Tap Server Address and enter `3.130.0.138:4443`.
- Tap Advanced Preferences.
- Tap Certificate.
- Download tree.desk.p12
- Tap Import, tap File System, and select the client certificate file you just downloaded.
- Enter `mistake.oval.great` when the Password prompt is displayed, and tap Connect.
- You'll see a checkmark next to the newly imported certificate. Tap the back button.
- Tap Done twice to save the connection.
- Tap the back button to return to the main screen. You should see streisand in the Connection section.
- Slide the AnyConnect VPN switch On.
- Tap Details when the Security Warning is displayed.
- Tap Import and Continue when the Certificate Summary is displayed.
- Tap Connect on the group selection screen. The correct default has already been chosen.
- If this is your first time using AnyConnect, you will need to accept the Connection Request dialog that Android displays.
- You should be good to go! You can verify that your traffic is being routed properly by looking up your IP address on DuckDuckGo. It should say Your public IP address is 3.130.0.138.

### Prompted for username?

Some users have reported that their Android AnyConnect clients prompt for a username and password. This is a known bug we don't understand. See the list of Streisand AnyConnect open issues. If you're affected, you could help us understand the bug by reporting your details using the issue list's New issue button's template. Fixes are gratefully accepted too.

If you're affected, you can use this workaround:

When prompted for a user, enter `streisand`
When prompted for a password, use `whisper.double.humble.ramp.weapon`

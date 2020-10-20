# Accessing The VPN

The VPN server is located in Singapore and can be used by either following the instructions on the site [vpn.divyasheel.com](vpn.divyasheel.com)
or following along here.

>note- The site [vpn.divyasheel.com](vpn.divyasheel.com) requires the following credentials
>
>  **username: streisand   
>  password: reason.island.zone.abuse.yard.version**


I'll be using OpenVPN and Wiregaurd for this illustration.


## For Linux
  * First, install OpenVPN.
    ```bash
    sudo apt-get install openvpn #for debian based
    ```
    Other Linux OS can refer to this [link](https://vpn.divyasheel.com/mirror/openvpn/).
  * Download any one of these ".ovpn" profile file from this [link](https://vpn.divyasheel.com/openvpn/#linux).
  * Copy this file ( *34.126.125.129-direct.ovpn* ) to a safe location like */etc/openvpn*.
  * Now run the command with file as argument
    ```bash
    sudo openvpn /etc/openvpn/34.126.125.129-direct.ovpn #if you saved it at /etc/openvpn
    ```
  * Now you should be all set.

## For Windows 
  * Download OpenVPN Windows Installer from [here](https://vpn.divyasheel.com/mirror/openvpn/).
  * Download and run the OpenVPN Windows Installer.
  * Click Next and accept the license agreement by selecting I Agree.
  * Click Next on the Choose Components screen. Leave all of the default options checked.
  * Make note of the Destination Folder. This is where you will place the 34.126.125.129-direct.ovpn client configuration profile after installation. Click Install.
  * A Windows Security notice will appear and ask Would you like to install this device software?. Click Install.
  * Click Next on the Installation Complete screen.
  * Uncheck Show Readme and click Finish.
  * Right-click on the OpenVPN GUI desktop icon and choose Properties.
  * Go to the Compatibility tab and click the Run this program as an administrator checkbox in the Privilege Level section.
  * Double-click the OpenVPN GUI desktop icon to launch the application.
  * Download any one of the OpenVPN profiles from [here](https://vpn.divyasheel.com/openvpn/#windows).
  * Open the config directory that is located in the Destination Folder. For most users, this will either be in **C:\Program Files\OpenVPN\config or C:\Program Files (x86)\OpenVPN\config**. 
    
    You will see a single README file in this directory.
  * Drag and drop the downloaded **34.126.125.129-direct.ovpn** file to this location alongside the README
  * Right-click on the OpenVPN icon in your taskbar and choose Connect.
  * You will see a log scroll by as the connection is established, followed by a taskbar notification indicating your assigned IP.
  * You should be set now.

## For Android
   * First install WireGaurd from Android Play Store.
   * Launch the app and tap the blue button to add a new tunnel.
   * Tap Create from QR code and grant the app permission to access the camera. A viewfinder will appear.
   * Use the camera to scan one of these client configuration QR codes.
     If you don' t have a second screen to scan from then you can use apps like Google Lens or other third-party applications that allow scanning from screen.
     * [luggage-later](https://vpn.divyasheel.com/wireguard/luggage-later.png)
     * [ritual-wrestle](https://vpn.divyasheel.com/wireguard/ritual-wrestle.png)
     * [monster-either](https://vpn.divyasheel.com/wireguard/monster-either.png)
     * [cycle-violin](https://vpn.divyasheel.com/wireguard/cycle-violin.png)
     * [smoke-glad](https://vpn.divyasheel.com/wireguard/smoke-glad.png)
     * [plunge-unveil](https://vpn.divyasheel.com/wireguard/plunge-unveil.png)
     * [supreme-stay](https://vpn.divyasheel.com/wireguard/supreme-stay.png)
  
## For macOS
  * Download and open Tunnelblick.
  * Type your password to allow the installation process to complete, and click OK.
  * Click Launch after the installation is finished.
  * Click I have configuration files.
  * Download one of these unified OpenVPN profiles from [here](https://vpn.divyasheel.com/openvpn/#macos)
   
  * Double-click the OpenVPN profile.
  * You will be asked to choose whether the profile should be available for all users or only the current user. After making your selection, you will be asked to enter your password.
Look for the Tunnelblick icon in your menu bar. Click on it, and choose Connect.

## For iOS

   * First install WireGaurd from Apple Play Store.
   * Launch the app and tap the blue button to add a new tunnel.
   * Tap Create from QR code and grant the app permission to access the camera. A viewfinder will appear.
   * Use the camera to scan one of these client configuration QR codes.
     
     * [luggage-later](https://vpn.divyasheel.com/wireguard/luggage-later.png)
     * [ritual-wrestle](https://vpn.divyasheel.com/wireguard/ritual-wrestle.png)
     * [monster-either](https://vpn.divyasheel.com/wireguard/monster-either.png)
     * [cycle-violin](https://vpn.divyasheel.com/wireguard/cycle-violin.png)
     * [smoke-glad](https://vpn.divyasheel.com/wireguard/smoke-glad.png)
     * [plunge-unveil](https://vpn.divyasheel.com/wireguard/plunge-unveil.png)
     * [supreme-stay](https://vpn.divyasheel.com/wireguard/supreme-stay.png)
  

### Remember, only one profile can be used at a time on a device( *only for WireGaurd* ). So choose accordingly.
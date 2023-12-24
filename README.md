# Win-11-ZerotierFix
To fix SMB shares not being accessible through Zerotier

[Credits](https://github.com/zerotier/ZeroTierOne/issues/1671)
<details>
   <summary>Automated One-Liner (Click Me)</summary>

   Copy and paste the following into your Windows 11 Terminal or Powershell with admin priviledges:
   ```
   irm https://raw.githubusercontent.com/8mpty/Win-11-ZerotierFix/main/Win-11-Zerotier-SMBFix.ps1 | iex
   ```
</details>
<details>
   <summary>Manual Commands (Click Me)</summary>
   Commands:
   
   1. Open Terminal/Powershell on your Windows 11 PC with Admin Priviledges.
   
   2. Copy and paste the following code into the command line and click enter:
      ```
      Get-NetConnectionProfile | Where-Object "InterfaceAlias" -like "Zero*"
      ```
      And check if the network catergory is Public. 
   4. If the ```NetworkCategory``` is ```Public```, then copy and paste this code into the command line:
      ```
      Get-NetConnectionProfile | Where-Object "InterfaceAlias" -like "Zero*" | Set-NetConnectionProfile -NetworkCategory Private
      ```
      Which is to set the ```NetworkCategory``` to ```Private``` in order for SMB shares on Windows 11 to work with Zerotier.
   5. If your ```NetworkCategory``` is already ```Private``` and not working, that means you have another problem with Zerotier which could be a bunch of factors for you to figure out.
</details>

﻿
Import-Module NetSecurity

#turn on off windows firewall
Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False

# yawc rules
New-NetFirewallRule -Name YAWC_Service -DisplayName “YAWC Service” -Description “YAWC Service” -Program "C:\Program Files (x86)\Yawcam\Yawcam_Service.exe" -RemoteAddress LocalSubnet -Action Allow -Protocol ICMPv4 -IcmpType 8 -Enabled True -Profile Any -Action Allow 

New-NetFirewallRule -Name YAWC_Service -DisplayName "YAWC Service" -Description "YAWC Service" -Program "C:\Program Files (x86)\Yawcam\Yawcam_Service.exe" -Enabled True -Profile Any -Action Allow 

New-NetFirewallRule -Name YAWC_Service -DisplayName "YAWC Service" -Description "YAWC Service" -Program "C:\Program Files (x86)\Yawcam\Yawcam_Service.exe" -Protocol TCP -Profile Any -Action Allow -Enabled True

Remove-NetFirewallRule -Name YAWC_Service

# Ultra Vnc rules

New-NetFirewallRule -Name "Uvnc_Service" -DisplayName “Unvc Service” -Description “Uvnc Service” -Program "C:\Program Files\uvnc bvba\UltraVNC\winvnc.exe" -Protocol TCP -Profile Any -Action Allow -Enabled True

# tightvnc
New-NetFirewallRule -Name TightVNC -DisplayName "TightVNC Service" -Description "TightVNC Service" -Program "C:\Program Files\TightVNC\tvnserver.exe" -Enabled True -Profile Any -Action Allow 
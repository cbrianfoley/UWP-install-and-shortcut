# Trigger install
Add-AppxProvisionedPackage -Online -PackagePath "\\server\path\appname.AppxBundle" -LicensePath "\\server\path\applicense.xml"

# Wait 1 minutes for it to install
Start-Sleep -Seconds 60

# Create desktop shortcut
$Appxpackage = get-appxpackage | where Name -EQ "InnovativeSystemsLLC.eLationReach"
$TargetFile = "C:\Windows\explorer.exe"
$TargetPath =  "shell:AppsFolder\" + $Appxpackage.PackageFamilyName + "!App"
$ShortcutFile = "C:\Users\Public\Desktop\eLation Reach.lnk"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut = $WScriptShell.CreateShortcut($ShortcutFile)
$Shortcut.TargetPath = $TargetPath
$Shortcut.Save()
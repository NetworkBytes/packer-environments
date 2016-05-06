$ie
Try {
    # DISABLING CONFIGURING PROXY
    # WE JUST WANT TO SET ANY PROXYSETTINGS PER MACHINE
    
    
    #$RegBase="Registry::HKLM\Software\Microsoft\Windows\CurrentVersion\Internet Settings"
    #$RegBaseWow="Registry::HKLM\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings"
    #$Proxy="proxy:3128"
    #$override="<local>;*.management"

    #Set-ItemProperty -Path "$RegBase"    ProxyEnable -value 1 -Type DWord
    #Set-ItemProperty -Path "$RegBaseWow" ProxyEnable -value 1 -Type DWord

    #Set-ItemProperty -Path "$RegBase"    ProxyServer -value $Proxy -Type String
    #Set-ItemProperty -Path "$RegBaseWow" ProxyServer -value $Proxy -Type String

    #Set-ItemProperty -Path "$RegBase"    ProxyOverride -value $override -Type String
    #Set-ItemProperty -Path "$RegBaseWow" ProxyOverride -value $override -Type String
    
    Write-Output "    Configuring proxy per machine, not per user"

    New-Item "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion" -Force
    New-Item "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Force
    New-ItemProperty -Path "Registry::HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Internet Settings" -Name ProxySettingsPerUser -value 0 -Type DWord -Force


    # for some reason the ProxyPerUser reg key does not activate untill IE has been opened as administrator
    # puppet and other apps will fail if IE has not been opened

    $url = "http://www.google.com.au/" 

    $ie = New-Object -COM "InternetExplorer.Application"
    $ie.visible = $true
    $ie.navigate($url)

    $count=0
    while ($ie.Busy -eq $true) 
    { 
        Start-Sleep -Milliseconds 1000; 
        if ($count -gt 20 ) { break; } else { $count = $count + 1 }
    } 
    exit 0
}
Catch 
{
    Write-Output $_
    Write-Output $_.GetType()
    Write-Output $_.Exception
    Write-Output $_.Exception.StackTrace
    throw $_.Exception
    exit 2
}
Finally 
{
    Write-Output "IE Complete"
    $ie.quit();
}

#TODO investigate why its erroring 
exit 0


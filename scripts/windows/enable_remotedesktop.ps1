Try {
  Write-Output " - Enable Remote Desktop"
  
  #Get-NetFirewallRule -DisplayName "Remote Desktop*" | Set-NetFirewallRule -enabled true
  netsh advfirewall firewall set rule group="Remote Desktop" new enable=yes
  exit 0
} 
Catch [Exception] {
    Write-Output $_
    Write-Output $_.GetType()
    Write-Output $_.Exception
    Write-Output $_.Exception.StackTrace
    throw $_.Exception
}
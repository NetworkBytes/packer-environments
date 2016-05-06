Try {
  Write-Output " - Disable IPv6"
  
  $RegBase = "HKLM:\SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters"
  New-ItemProperty -Path $RegBase -Name DisabledComponents -PropertyType DWORD -Value '0xffffffff' -Force


} 
Catch [Exception] {
    Write-Output $_
    Write-Output $_.GetType()
    Write-Output $_.Exception
    Write-Output $_.Exception.StackTrace
    throw $_.Exception
}




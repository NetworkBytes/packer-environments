Try {
  Write-Output " - Disable Hibernation"
  
  $RegBase = "HKLM:\SYSTEM\CurrentControlSet\Control\Power"
  New-ItemProperty -Path $RegBase -Name HibernateEnabled     -PropertyType DWORD -Value 0 -Force
  New-ItemProperty -Path $RegBase -Name HiberFileSizePercent -PropertyType DWORD -Value 0 -Force
  exit 0
} 
Catch [Exception] {
    Write-Output $_
    Write-Output $_.GetType()
    Write-Output $_.Exception
    Write-Output $_.Exception.StackTrace
    throw $_.Exception
}
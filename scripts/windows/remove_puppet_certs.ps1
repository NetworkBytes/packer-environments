Try {
  Write-Output " - Removing Puppet Certs"

  $SSLDir = "C:\ProgramData\PuppetLabs\puppet\etc\ssl"
  Remove-Item $SSLDir\* -Force -Recurse
  exit 0
} 
Catch [Exception] {
    Write-Output $_
    Write-Output $_.GetType()
    Write-Output $_.Exception
    Write-Output $_.Exception.StackTrace
    throw $_.Exception
}

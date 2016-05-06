Try {
  Write-Output " - Download Puppet Certificates"
   
  $CertBase = $env:TEMP + "\puppet\ssl"
  
  $WebClient = New-Object System.Net.WebClient
  $URLBase = 'http://files/PuppetLabs/packer/ssl'
  
  $Files = @("certs/ca.pem","certs/packer.pem","private_keys/packer.pem")
  ForEach ( $file in $Files) {
    $DownloadUrl = "$UrlBase/$file"
    $localFile = ("$CertBase\" + $file).replace('/', '\')
    
    Write-Output "   Downloading file from: $DownloadUrl"
    Write-Output "   Downloading file to $localfile"
    
    # Create directory
    New-Item (Split-Path -parent $localFile) -type directory -force
    
    # download file
    If (-Not(Test-Path $localFile)){
      $WebClient.DownloadFile($DownloadURL, $localFile)
    }Else{
      Write-Output "$localFile already exists, skipping download"
    }
  }

  Write-Output " - Executing Puppet"
  # Commented out using echo
  & echo 'C:/Program Files/Puppet Labs/Puppet/bin/Puppet.bat' agent --test --onetime --no-daemonize --pluginsync --certdir=$($CertBase + "\certs")  --privatekeydir=$($CertBase + "\private_keys") --detailed-exitcodes --certname=packer
} 
Catch [Exception] {
    Write-Output $_
    Write-Output $_.GetType()
    Write-Output $_.Exception
    Write-Output $_.Exception.StackTrace
    throw $_.Exception
}




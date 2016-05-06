Try {
  # Use Chocolatey to intall puppet-agent
  #C:\ProgramData\chocolatey\bin\cinst.exe -y puppet-agent -source http://nuget/api/v2/
  C:\ProgramData\chocolatey\bin\cinst.exe -y puppet-agent


    #$FileName="C:\Windows\Temp\puppet.msi"
    #$Client = New-Object System.Net.WebClient
    #$DownloadURL = "http://files/PuppetLabs/puppet-agent-1.1.0-x64.msi"
    #
    #Write-Output "Downloading $DownloadURL....."
    #If (-Not(Test-Path $FileName)){
    #  $Client.DownloadFile($DownloadURL, $FileName)
    #}Else{
    #  Write-Output "$FileName already exists, skipping download"
    #}
    #
    #
    #Write-Output "Installing file $FileName....."
    #$process = Start-Process -FilePath msiexec.exe -ArgumentList /i, $FileName, /qb  -Wait -PassThru
    #if ($process.ExitCode -eq 0) {
    #    Write-Output "$FileName has been successfully installed"
    # 
    #    Write-Output "Restarting ssh service to pick up path"
    #    Get-Service -Name "*ssh*"| Restart-Service -Verbose -Force 
    #    Write-Output "install complete... exiting"
    #    #exit 0
    #} else {
    #    Write-Output "installer exit code  $($process.ExitCode) for file  $($FileName)"
    #    exit 1
    #}


    ## add 64 bit environment variables missing from SSH
    #Write-Host "Setting SSH environment"
    #$is_64bit = [IntPtr]::size -eq 8
    #$sshenv = "TEMP=C:\Windows\Temp"
    #if ($is_64bit) {
    #    $env_vars = "ProgramFiles(x86)=C:\Program Files (x86)", `
    #        "ProgramW6432=C:\Program Files", `
    #        "CommonProgramFiles(x86)=C:\Program Files (x86)\Common Files", `
    #        "CommonProgramW6432=C:\Program Files\Common Files"
    #    $sshenv = $sshenv + "`r`n" + ($env_vars -join "`r`n")
    #    write-host "$sshenv"
    #}
    #Set-Content C:\Users\packer\.ssh\environment $sshenv
    #
    ## record the path for provisioners (without the newline)
    #Write-Host "Recording PATH for provisioners"
    #Set-Content C:\Windows\Temp\PATH ([byte[]][char[]] $env:PATH) -Encoding Byte
    
    #exit 0


} 
Catch [Exception] {
    Write-Output $_
    Write-Output $_.GetType()
    Write-Output $_.Exception
    Write-Output $_.Exception.StackTrace
    throw $_.Exception
}

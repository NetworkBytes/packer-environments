Try {
    # Use Chocolatey to intall vmware-tools
    #C:\ProgramData\chocolatey\bin\cinst.exe -y vmware-tools -source http://nuget/api/v2/
    C:\ProgramData\chocolatey\bin\cinst.exe -y vmware-tools

    #Write-Output "Checking to see if the vmware tools cd mounted....."
    #foreach ($letter in 97..122) { #A..Z
    #    Write-Output "searching for setup.exe in $([char]$letter):\"
    #    If (Test-Path "$([char]$letter):\setup.exe"){
    #        Write-Output "found setup.exe in $([char]$letter):\"
    #        $FileName="$([char]$letter):\setup.exe"
    #        break
    #    }
    #}
    #
    # Packer will upload the files to the temp directory
    #$FileName="C:\Windows\Temp\vmtools\setup.exe"
    #
    #if ([string]::IsNullOrEmpty($FileName)) { 
    #    throw [System.IO.FileNotFoundException] "setup file not found." 
    #}
    #
    #Write-Output "Executing $FileName....."
    #$process = Start-Process -FilePath $FileName -ArgumentList "/S /v`"/qn REBOOT=ReallySuppress`"" -Wait -PassThru
    #if ($process.ExitCode -eq 0 -or $process.ExitCode -eq 3010) {
    #  Write-Output "$FileName has been successfully executed"
    #  exit 0
    #} else {
    #  Write-Output "installer exit code  $($process.ExitCode) for file  $($FileName)"
    #  exit 1
    #}
} 
catch [Exception] {
    Write-Output $_
    Write-Output $_.GetType()
    Write-Output $_.Exception
    Write-Output $_.Exception.StackTrace
    throw $_.Exception 
    exit 2
}



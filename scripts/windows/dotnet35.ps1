Try {
  # Only Tested on Windows 2012

  #1. Get wim index number that matches "Server edition with GUI"
  #dism /get-wiminfo /wimfile:d:\sources\install.wim

  #2. mount the wim to an empty folder
  #dism /mount-wim /wimfile:d:\sources\install.wim /index:<indexnumber> /mountdir:c:\mountdir /readonly

  #3. Install with alternate source path
  Install-WindowsFeature net-framework-core -source D:\Sources\sxs
 
   # TODO - detect the cdrom drive 
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
@ECHO OFF

:: Packer build wrapper script
:: John Bencic


SET HOURPAD=%TIME: =0%
SET DATEf=%date:~10,4%%date:~7,2%%date:~4,2%.%HOURPAD:~0,2%%time:~3,2%

SET USER=root
SET PASSWORD=vagrant

SET NAME=Redhat-7.1-x86_64
SET BUILDNAME=%NAME%_Template_%DATEf%
SET HOST_NAME=packer
SET OVFTOOLPATH=C:\Program Files\VMware\VMware OVF Tool
SET PATH=%PATH%;%OVFTOOLPATH%
SET BASEDIR=D:\Provisioning\Packer\packer-environments

%BASEDIR:~0,2%
cd %BASEDIR%
echo %CD%

SET ISO=D:/Software/Redhat/rhel-server-7.1-x86_64-dvd.iso
SET GUEST_OS_TYPE=rhel7-64

SET    VCENTER_USER=Administrator@vsphere.local
SET /p VCENTER_PASS=<.Vars.bat

SET PACKER_LOG=1
SET PACKER_LOG_PATH=.\logs\%BUILDNAME%.log

echo "... Building %BUILDNAME%"
.\bin\packer build ^
  -var name=%BUILDNAME% ^
  -var host_name=%HOST_NAME% ^
  -var user=%USER% ^
  -var password=%PASSWORD% ^
  -var guest_os_type=%GUEST_OS_TYPE% ^
  -var iso_url=%ISO% ^
  -var vcenter_user=%VCENTER_USER% ^
  -var vcenter_password=%VCENTER_PASS% ^
  .\templates\Redhat-7.1-x86_64.json


IF %ERRORLEVEL% NEQ 0 (
  ECHO "Build failed - no artifact was produced"
  EXIT /B 1     
) ELSE (
  ECHO "Build Successful"
  EXIT /B 0
)
@ECHO off

SET DIR_TRG=C:\_\TEST_TF
SET VMWS_URL=http://localhost:8697/api
SET VMWS_USER=VMREST_USR
SET VMWS_PASSWORD=UVMPass@1121
SET VMWS_DEBUG=1

ECHO ==========================================================================
ECHO SET DIRECTORY [%DIR_TRG%]
ECHO ==========================================================================
MD %DIR_TRG%
robocopy "%~dp0TF" %DIR_TRG% /MIR
CD %DIR_TRG%
PAUSE
CLS
ECHO ==========================================================================
ECHO TERRAFORM INIT
ECHO ==========================================================================
terraform.exe init
PAUSE
CLS
ECHO.
ECHO ==========================================================================
ECHO TERRAFORM PLAN
ECHO ==========================================================================
terraform.exe plan -out plan.tfp
PAUSE
CLS
ECHO.
ECHO ==========================================================================
ECHO TERRAFORM GRAPH
ECHO ==========================================================================
terraform graph -plan=plan.tfp
PAUSE
REM CLS
REM ECHO.
REM ECHO ==========================================================================
REM ECHO TERRAFORM APPLY
REM ECHO ==========================================================================
REM terraform apply plan.tfp
REM PAUSE
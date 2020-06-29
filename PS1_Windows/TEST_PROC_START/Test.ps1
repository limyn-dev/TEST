[string]   $script:SPH = $MyInvocation.MyCommand.Definition                         # Set script path and name
           $script:SPH = Split-Path -Path $script:SPH -Parent                       #
[string]   $script:API = [IO.File]::ReadAllText("$($script:SPH)\API.cs")

Add-Type -TypeDefinition $script:API -Language CSharp

$procInfo = New-Object Session0.AppLaunch+PROCESS_INFORMATION
[Session0.AppLaunch]::Start("notepad.exe","c:\\windows\\system32",[ref]$procInfo)
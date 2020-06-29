[string]    $script:NSP = "root\cimv2"
[string]    $script:CLS = "SCCM_REG_VAL"
[int]       $script:RTC = 0
function SetWmiClass {
   [object] $O = $null   
   if ((GWMI -Namespace $script:NSP -Class $script:CLS -List) -eq $null) {
      $O = New-Object System.Management.ManagementClass ($script:NSP, [String]::Empty, $null)
      $O.__CLASS = $script:CLS
      $O.Qualifiers.Add("Static" , $true)
      $O.Properties.Add("ValPath", [System.Management.CimType]::String, $false)
      $O.Properties.Add("ValType", [System.Management.CimType]::String, $false)
      $O.Properties.Add("ValData", [System.Management.CimType]::String, $false)
      $O.Properties["ValPath"].Qualifiers.Add("Key", $true)
      $O.Put() | OUT-NULL
   }
}
function SetWmiInstance {
   param ( [string] $sKey = ""
         , [string] $sVal = "")
   [hashtable] $A = @{}
   [object]    $K = $null
   if (TEST-PATH $sKey) {
      $K = GI -Path $sKey
      $A.Add( 'ValPath', "$sKey[$sVal]" )
      $A.Add( 'ValData', [string]$K.GetValue($sVal) )
      $A.Add( 'ValType', $K.GetValueKind($sVal)     )
      Set-WmiInstance -Class $script:CLS -Arguments $A | OUT-NULL
   }
}
try   { Remove-WmiObject -Class $script:CLS                                       }
catch { EXIT 1                                                                    }
try   { SetWmiClass                                                               }
catch { EXIT 2                                                                    }
try   { SetWmiInstance 'HKLM:\SOFTWARE\ICRC' 'ICRCWindowsNext'                    }
catch { $script:RTC = 3                                                           }
try   { SetWmiInstance 'HKLM:\SOFTWARE\ICRC' 'MULTI'                              }
catch { $script:RTC = 3                                                           }
try   { SetWmiInstance 'HKLM:\SOFTWARE\ICRC' 'BIN'                                }
catch { $script:RTC = 3                                                           }
try   { SetWmiInstance 'HKLM:\SOFTWARE\ODBC\ODBCINST.INI\ODBC Core' 'UsageCount'  }
catch { $script:RTC = 3                                                           }
try   { SetWmiInstance 'HKLM:\SOFTWARE\Microsoft\AppV\Subsystem' 'Modules'        }
catch { $script:RTC = 3                                                           }
EXIT $script:RTC


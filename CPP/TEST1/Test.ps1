
[string] $script:CERT_EKU_PROP = ""

function Get-CertificateEKUProperty {
   [CmdletBinding()]
   param( [Parameter(Mandatory = $true)]
          [Security.Cryptography.X509Certificates.X509Certificate2]$Cert   )
   #-------------------------------------------------------------------------------#
   #-------------------------------------------------------------------------------#
   [string] $C = ""                                                                 # API import
   [intPtr] $H = $Cert.Handle                                                       # Certificat handler
   [uint]   $S = 0                                                                  # Data size
   [byte[]] $D = @()                                                                # Byte array Data 
   [object] $A = $null                                                              #
   [object] $E = $null                                                              #
   
   #                                                                                -----------------------------------
   $C += '[DllImport("Crypt32.dll", SetLastError = true, CharSet = CharSet.Auto)]'  # API definition
   $C += 'public static extern bool CertGetCertificateContextProperty(           '  #
   $C += '   IntPtr pCertContext,                                                '  #
   $C += '   uint dwPropId,                                                      '  #
   $C += '   Byte[] pvData,                                                      '  #
   $C += '   ref uint pcbData                                                    '  #
   $C += ');                                                                     '  #
   Add-Type -MemberDefinition $C -Namespace 'PKI' -Name 'Crypt32'                   #
   #                                                                                -----------------------------------
   if ($Cert.Equals([IntPtr]::Zero))                                             {  # Check certificat parameter
     Write-Error "Certificat parameter requried."                                   #
     return                                                                      }  #
   #                                                                                -----------------------------------
   if (!([PKI.Crypt32]::CertGetCertificateContextProperty($H,0x9,$null,[ref]$S))){  # Get size of data
      Write-Error "Fisrt call of CertGetCertificateContextProperty faild."          #
   return                                                                        }  #
   #                                                                                -----------------------------------   
   $D = New-Object byte[] -ArgumentList $S                                          # create a buffer for ASN.1 encoded byte array         
   #                                                                                -----------------------------------      
   [void][PKI.Crypt32]::CertGetCertificateContextProperty($H,0x9,$D,[ref]$S)        # Get data
   #                                                                                -----------------------------------         
   $A = New-Object Security.Cryptography.AsnEncodedData (,$D)                       # instantiate AsnEncodedData object with ASN.1 encoded byte array
   $E = New-Object Security.Cryptography.X509Certificates.X509EnhancedKeyUsageExtension $A, $false   # instaintiate X509EnhancedKeyUsageExtension to retrieve OIDs in a readable form
   #                                                                                -----------------------------------            
   if ($E.EnhancedKeyUsages.Count -eq 0)                                         {  # if none OIDs are defined, then all certificate purposes are explicitly disabled in the properties
      $script:CERT_EKU_PROP = "All purposes are explicitly disabled."            }  #
   else                                                                          {  #
      $E.EnhancedKeyUsages | %                                                {     #
         $script:CERT_EKU_PROP += $_                                          }  }  # return constrained OIDs
   #                                                                                -----------------------------------            
}
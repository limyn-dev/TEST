#==================================================================================#
#
# Simple rights:
#    D  - Delete access
#    F  - Full access (Edit_Permissions+Create+Delete+Read+Write)
#    N  - No access
#    M  - Modify access (Create+Delete+Read+Write)
#    RX - Read and eXecute access
#    R  - Read-only access
#    W  - Write-only access
#
# inheritance (only to directories):
#    (OI) - object inherit
#    (CI) - container inherit
#    (IO) - inherit only
#    (NP) - don’t propagate inherit
#    (I)  - Permission inherited from parent container
#
#==================================================================================#
[string] $F = "C:\_Test_ACL"                                                        # Folder to configure
[string] $R = "USER_TEST:(OI)(CI)M"                                                 # User and Right 
#                                                                                   -----------------------------------
if (!(TEST-PATH $F)) {                                                              # Create folder if not exists
    "" | OUT-HOST; "Create folder [$F]"                                             #
    MD $F -Force | OUT-NULL                                                         #
}                                                                                   #
#                                                                                   -----------------------------------
"" | OUT-HOST; "Add right [$R] to folder [$F]"                                      # Set right
icacls $F /grant $R | OUT-NULL                                                      #
#                                                                                   -----------------------------------
"" | OUT-HOST; "Rights on folder [$F]" | OUT-HOST                                   # Get right
icacls $F                                                                           #
#                                                                                   -----------------------------------
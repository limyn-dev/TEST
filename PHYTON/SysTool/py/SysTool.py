#region **********[ GLOBALS     ]****************************************************
#                                                                                   -----------------------------------
OS_NAME = ""                                                                        #
MAX_ROW = 0                                                                         #
MAX_COL = 0                                                                         #
ITM_LST = {}                                                                        #
ROW_LST = {}                                                                        #
NAV_PTH = []                                                                        #
#                                                                                   -----------------------------------
#endregion
#region **********[ ITEMS       ]****************************************************
def ITM_Set      (sParent, sType, sName, sValue):
    #-------------------------------------------------------------------------------#
    # Types of items                                                                #
    #    C : Container                                                              #
    #    R : Readonly value                                                         #
    #    W : Writeable value                                                        #
    #    A : Action                                                                 #
    #-------------------------------------------------------------------------------#
    #                                                                               -----------------------------------
    aItm = {'TPE':sType, 'VAL':sValue, 'LNK':""}                                    # Create item
    #                                                                               -----------------------------------
    ITM_LST.update({sName:aItm})                                                    # Add item to list
    #                                                                               -----------------------------------
    if sParent != "":                                                               # Update parent link
        if ITM_LST[sParent]['LNK'] != "":                                           #
            ITM_LST[sParent]['LNK'] += ';'                                          #
        ITM_LST[sParent]['LNK'] += sName                                            #
def ITM_Platform ():
    #-------------------------------------------------------------------------------#
    #-------------------------------------------------------------------------------#
    #                                                                               -----------------------------------
    ITM_Set('PLATFORM', 'R', 'PLATFORM<Processor>' , platform.processor()  )        #
    ITM_Set('PLATFORM', 'R', 'PLATFORM<Machine>'   , platform.machine()    )        #
    ITM_Set('PLATFORM', 'R', 'PLATFORM<Platform>'  , platform.platform()   )        #
    ITM_Set('PLATFORM', 'R', 'PLATFORM<Name>'      , platform.uname().node )        #
def ITM_NicInfo  ():
    #-------------------------------------------------------------------------------#
    #-------------------------------------------------------------------------------#
    sNnm = ""                                                                       #
    sMac = ""                                                                       #
    sIp4 = ""                                                                       #
    sSm4 = ""                                                                       #
    #                                                                               -----------------------------------
    aNic = psutil.net_if_addrs()                                                    #
    for N in aNic.items():                                                          #
        sNme = 'NIC/' + N[0]                                                        #
        sIp4 = ""                                                                   #
        sSm4 = ""                                                                   #
        sMac = ""                                                                   #
        for I in N[1]:                                                              #
            if   str(I[0]) == 'AddressFamily.AF_LINK':                              #
                if sMac != "" :                                                     #
                    sMac += '/'                                                     #
                sMac += I[1]                                                        #
            elif str(I[0]) == 'AddressFamily.AF_INET':                              #
                if sIp4 != "" :                                                     #
                    sIp4 += '/'                                                     #
                sIp4 += I[1]                                                        #
                if sSm4 != "" :                                                     #
                    sSm4 += '/'                                                     #
                sSm4 += I[2]                                                        #
        ITM_Set('NIC_LIST', 'C', sNme                    , ""  )                    #
        ITM_Set(sNme      , 'R', sNme + '<Name>'         , N[0])                    #
        ITM_Set(sNme      , 'R', sNme + '<Mac Address>'  , sMac)                    #
        ITM_Set(sNme      , 'R', sNme + '<Ipv4 Address>' , sIp4)                    #
        ITM_Set(sNme      , 'R', sNme + '<Ipv4 NetMask>' , sSm4)                    #
#endregion
#region **********[ ACTIONS     ]****************************************************    
#def ACT_LNX_NicIpV4Set (iface, ip):
#    #-------------------------------------------------------------------------------#
#    #-------------------------------------------------------------------------------#
#    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)                        # Get socket TCP and UDP
#    bin_ip = socket.inet_aton(ip)                                                   # Set binary IP value
#    ifreq = struct.pack('16sH2s4s8s', iface, socket.AF_INET, '\x00' * 2, bin_ip, '\x00' * 8)
#    fcntl.ioctl(sock, SIOCSIFADDR, ifreq)                                           # Wrire to soke
#    #                                                                               -----------------------------------
def ACT_WIN_NicIpV4Set (sNicName, sIpAddress, sSubnetmask, sGateway):    
    #-------------------------------------------------------------------------------#
    #-------------------------------------------------------------------------------#
    #                                                                               -----------------------------------    
    import wmi                                                                      #
    #                                                                               -----------------------------------    
    aNac = wmi.WMI().Win32_NetworkAdapterConfiguration(IPEnabled=True)              # Get NIC list
    nNac = 0                                                                        #
    #                                                                               -----------------------------------
    for i in aNac:                                                                  # Select nic
        if aNac[i] == sNicName:                                                     #
            nNac = i                                                                #
    #                                                                               -----------------------------------            
    aNac[nNac].EnableStatic(IPAddress=[sIpAddress],SubnetMask=[sSubnetmask])        # Configure
    aNac[nNac].SetGateways(DefaultIPGateway=[sGateway])                             #
    #                                                                               -----------------------------------            
#endregion
#region **********[ PAGES       ]****************************************************
def PGE_Show():
    #-------------------------------------------------------------------------------#
    #-------------------------------------------------------------------------------#
    nIns = 0                                                                        # Items name size max
    nRow = 0                                                                        # Rows counter
    sRow = ""                                                                       # Row string
    sNme = NAV_PTH[len(NAV_PTH)-1]                                                  # Item name
    #                                                                               -----------------------------------
    for N in ITM_LST[sNme]['LNK'].split(';'):                                       #
        nRow += 1                                                                   #
        ROW_LST.update({chr(nRow+64):N})                                            #
        if len(N) > nIns:                                                           #
            nIns = len(N)                                                           #
    #                                                                               -----------------------------------
    os.system('cls')                                                                # Clear screen
    #                                                                               -----------------------------------
    print('                                                                  ')     # Display header
    print(str(NAV_PTH) + '                                                   ')     #
    print('------------------------------------------------------------------')     #
    #                                                                               -----------------------------------
    nRow = 0                                                                        # Display rows
    for K in ROW_LST :                                                              #
        nRow += 1                                                                   #
        sNme = ROW_LST[K]                                                           #
        if ITM_LST[sNme]['TPE'] == 'C':                                             #
            sRow = '[' + K + '] ' + sNme                                            #
        elif ITM_LST[sNme]['TPE'] == 'R':                                           #
            sRow  = '    ' + sNme + (' ' * (nIns-len(sNme)+1))                      #
            sRow += ': [' + ITM_LST[sNme]['VAL'] + ']'                              #
        elif ITM_LST[sNme]['TPE'] == 'W':                                           #
            sRow  = '[' + K + '] ' + sNme + (' ' * (nIns-len(sNme)+1))              #
            sRow += '= [' + ITM_LST[sNme]['VAL'] + ']'                              #
        print(sRow)                                                                 #
    #                                                                               -----------------------------------
    nRow += 1                                                                       # Add navigation
    print('[.] Quit')                                                               #
    #                                                                               -----------------------------------
    while nRow < MAX_ROW:                                                           # Add blank lines
        nRow += 1                                                                   #
        print("")                                                                   #
    #                                                                               -----------------------------------
    print("==================================================================")     # Get user input
def PGE_Next(sChoice):
    #-------------------------------------------------------------------------------#
    #-------------------------------------------------------------------------------#
    #                                                                               -----------------------------------
    sNme = ""                                                                       # Item name
    #                                                                               -----------------------------------
    if sChoice == '.':                                                              # Select next name
        NAV_PTH.pop(len(NAV_PTH)-1)                                                 #
    else:                                                                           #
        sNme = ROW_LST[sChoice.upper()]                                             #
        NAV_PTH.append(sNme)                                                        #
#endregion
#region **********[ ENTRY POINT ]****************************************************
if __name__ == "__main__":
    #                                                                               -----------------------------------
    import socket                                                                   #
    import struct                                                                   #
    import platform                                                                 # Global import
    import os                                                                       #
    import psutil                                                                   #
    #                                                                               -----------------------------------
    if 'linux' in platform.platform().lower():                                      # OS specific
        OS_NAME = "LINUX"                                                           #
        import fcntl                                                                #
    elif 'windows' in platform.platform().lower():                                  #
        OS_NAME = "WINDOWS"                                                         #
    #                                                                               -----------------------------------
    MAX_ROW = os.get_terminal_size().lines - 8                                      # Screen size
    MAX_COL = os.get_terminal_size().columns                                        #
    #                                                                               -----------------------------------
    ITM_Set(""     ,'C', 'LOCAL'   , "")                                            # Items list initialize
    ITM_Set("LOCAL",'C', 'PLATFORM', "")                                            #
    ITM_Set("LOCAL",'C', 'NIC_LIST', "")                                            #
    #                                                                               -----------------------------------
    ITM_Platform()                                                                  # Load platform values
    ITM_NicInfo()                                                                   # Load platform values
    #print(ITM_LST)
    #input()
    #                                                                               -----------------------------------
    NAV_PTH.append('LOCAL')                                                         # Current item initialisation
    #                                                                               -----------------------------------
    while len(NAV_PTH):                                                             # Menu loop
        ROW_LST = {}                                                                #    Reset rows list
        PGE_Show()                                                                  #    Display item
        PGE_Next(input())                                                           #    Select next item
#endregion
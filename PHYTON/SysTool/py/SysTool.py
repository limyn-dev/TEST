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
def ITM_Set(sParent, sType, sName, sValue):
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
def ITM_Platform():
    #-------------------------------------------------------------------------------#
    #-------------------------------------------------------------------------------#
    #                                                                               -----------------------------------
    ITM_Set('PLATFORM', 'R', 'Processor' , platform.processor()  )                  #
    ITM_Set('PLATFORM', 'R', 'Machine'   , platform.machine()    )                  #
    ITM_Set('PLATFORM', 'R', 'Platform'  , platform.platform()   )                  #
    ITM_Set('PLATFORM', 'R', 'Name'      , platform.uname().node )                  #
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
    print('[' + sNme + ']                                                    ')     #
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
    import pip                                                                      # Global import
    import time                                                                     #
    import platform                                                                 #
    import os                                                                       #
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
    ITM_Set(""     ,'C', 'ITEMS'   , "")                                            # Items list initialize 
    ITM_Set("ITEMS",'C', 'PLATFORM', "")                                            #
    ITM_Set("ITEMS",'C', 'NETWORK' , "")                                            #
    #                                                                               -----------------------------------
    ITM_Platform()                                                                  # Load platform values
    #                                                                               -----------------------------------
    NAV_PTH.append('ITEMS')                                                         # Current item initialisation
    #                                                                               -----------------------------------
    while len(NAV_PTH):                                                             # Menu loop
        ROW_LST = {}                                                                #    Reset rows list
        PGE_Show()                                                                  #    Display item
        PGE_Next(input())                                                           #    Select next item
#endregion
import datetime
#
# *********[ FUNCTIONS ]***********************************************************************************************
#

def WL    (sText) :
    #-------------------------------------------------------------------------------
    #-------------------------------------------------------------------------------
    D = datetime.datetime.now()
    print (D.strftime("%Y/%m/%d %H:%M:%S"), ">", sText)
def WS    ()      :
    #-------------------------------------------------------------------------------
    #-------------------------------------------------------------------------------
    WL("-" * 105)    
def START ()      :
    #-------------------------------------------------------------------------------
    #-------------------------------------------------------------------------------
    WS()
    WL("Start script")
    WS()
def STOP  ()      :
    #-------------------------------------------------------------------------------
    #-------------------------------------------------------------------------------
    WS()
    WL("End of script")
    WS()
#
# EOF
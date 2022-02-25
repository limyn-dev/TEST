#region **********[ IMPORTS             ]******************************************************************************
#
from http.server import BaseHTTPRequestHandler
from http.server import HTTPServer
import time
import platform
#
#endregion
#region **********[ GLOBALS             ]******************************************************************************
#
HostName   = "localhost"
ServerPort = 888
#
#endregion
#region **********[ CLASS HttpServer      ]******************************************************************************
#
class HttpServer(BaseHTTPRequestHandler):
    def PageSysInfo(self):
        #---------------------------------------------------------------------------#
        #---------------------------------------------------------------------------#
        sHtm = ''                                                                   #
        #                                                                           -----------------------------------
        sHtm+= '<H3>System info</H3>'                                               # Build info table
        sHtm+= '<TABLE>'                                                            #
        sHtm+= '  <TR><TD>uname.machine</TD>'                                       #
        sHtm+= '      <TD>' + platform.uname().machine + '</TD></TR>'               #
        sHtm+= '  <TR><TD>uname.system</TD>'                                        #
        sHtm+=       '<TD>' + platform.uname().system  + '</TD></TR>'               #
        sHtm+= '  <TR><TD>uname.version</TD>'                                       #
        sHtm+= '      <TD>' + platform.uname().version + '</TD></TR>'               #
        sHtm+= '  <TR><TD>uname.node</TD>'                                          #
        sHtm+= '      <TD>' + platform.uname().node    + '</TD></TR>'               #
        sHtm+= '  <TR><TD>machine</TD>'                                             #
        sHtm+= '      <TD>' + platform.machine()   + '</TD></TR>'                   #
        sHtm+= '  <TR><TD>version</TD>'                                             #
        sHtm+= '      <TD>' + platform.version()   + '</TD></TR>'                   #
        sHtm+= '  <TR><TD>platform</TD>'                                            #
        sHtm+= '      <TD>' + platform.platform()  + '</TD></TR>'                   #
        sHtm+= '  <TR><TD>system</TD>'                                              #
        sHtm+= '      <TD>' + platform.system()    + '</TD></TR>'                   #
        sHtm+= '  <TR><TD>processor</TD>'                                           #
        sHtm+= '      <TD>' + platform.processor() + '</TD></TR>'                   #
        sHtm+= '</TABLE>'                                                           #
        #                                                                           -----------------------------------
        return sHtm                                                                 #
        #---------------------------------------------------------------------------#
    def PageSysCommand(self):
        #---------------------------------------------------------------------------#
        #---------------------------------------------------------------------------#
        sHtm = ''                                                                   #
        #                                                                           -----------------------------------
        sHtm+= '<H3>Command</H3>'                                                   # Command page
        #                                                                           -----------------------------------
        return sHtm                                                                 #
        #---------------------------------------------------------------------------#        
    def PageNetConfig(self):
        #---------------------------------------------------------------------------#
        #---------------------------------------------------------------------------#
        sHtm = ''                                                                   #
        #                                                                           -----------------------------------
        sHtm+= '<H3>Network configuration</H3>'                                     # Network configuration page
        #                                                                           -----------------------------------
        return sHtm                                                                 #
        #---------------------------------------------------------------------------#                
    def Lg(self, sCaller, sText):
        #---------------------------------------------------------------------------#
        #---------------------------------------------------------------------------#
        print("%s [%s]" % (sCaller, sText))                                         # 
        #---------------------------------------------------------------------------#
    def do_GET(self):
        #---------------------------------------------------------------------------#
        #---------------------------------------------------------------------------#
        sClr = 'do_GET         :'                                                   #
        sPth = ''                                                                   #
        sPge = ''                                                                   #
        sHtm = ''                                                                   #
        #                                                                           -----------------------------------
        #self.Lg(sClr, 'Get[' + self.path + ']')                                     #
        #                                                                           -----------------------------------
        if   self.path.lower() == "/favicon.ico":                                   # Page routing
            sPth = '/SysInfo'                                                       #
            sPge = self.PageSysInfo()                                               #
        elif self.path.lower() == '/syscommand':                                    #
            sPth = '/SysCommand'                                                    #
            sPge = self.PageSysCommand()                                            #
        elif self.path.lower() == '/netconfig':                                     #
            sPth = '/NetConfig'                                                     #
            sPge = self.PageNetConfig()                                             #
        else:                                                                       #
            sPth = '/SysInfo'                                                       #
            sPge = self.PageSysInfo()                                               #
        #                                                                           -----------------------------------
        sHtm += '<HTML>'                                                            # Build page
        sHtm += '<HEAD>'                                                            #
        sHtm += '<link rel="icon" href="data:image/png;base64,'                     #
        sHtm += 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAIAAACQd1PeA'                     #
        sHtm += 'AAADElEQVQI12P4//8/AAX+Av7czFnnAAAAAElFTkSuQmCC">'                 #
        sHtm += '  <title>SysInfo</title>'                                          #
        sHtm += '</HEAD>'                                                           #
        sHtm += '<BODY>'                                                            #
        sHtm += '  <DIV><A href="./SysInfo">SysInfo</A>'                            #
        sHtm += '       <A href="./SysCommand">SysCommand</A>'                      #
        sHtm += '       <A href="./NetConfig">NetConfig</A></DIV>'                  #
        sHtm += '  <DIV><P>Path: ' + sPth + '</P></DIV>'                            #
        sHtm += '  <DIV>         ' + sPge + '</DIV>'                                #
        sHtm += '<BODY>'                                                            #
        sHtm += '<HTML>'                                                            #
        #                                                                           -----------------------------------
        self.send_response(200)                                                     # Send page
        self.send_header("Content-type", "text/html")                               #
        self.end_headers()                                                          #
        self.wfile.write(bytes(sHtm, "utf-8"))                                      #
        #---------------------------------------------------------------------------#
#
#endregion
#region **********[ ENTRY POINT         ]******************************************************************************
#
if __name__ == "__main__":
    #-------------------------------------------------------------------------------#
    #-------------------------------------------------------------------------------#
    oSrv = HTTPServer((HostName, ServerPort), HttpServer)                           #
    #                                                                               -----------------------------------
    print('WebServer.py   : HTTP Server started')                                   #
    print('WebServer.py   :    Host [' + HostName        + ']')                     #
    print('WebServer.py   :    Port [' + str(ServerPort) + ']')                     #
    #                                                                               -----------------------------------
    try:                                                                            #
        oSrv.serve_forever()                                                        #
    except KeyboardInterrupt:                                                       #
        pass                                                                        #
    #                                                                               -----------------------------------
    oSrv.server_close()                                                             # Stop HTTP server
    print('WebServer.py   : HTTP Server stopped')                                   #
    #-------------------------------------------------------------------------------#
#
#endregion
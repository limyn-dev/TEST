/*==================================================================================

   Description: 
      Basic http server.
   
   History:
      07.12.2018 delay.yves@gmail.com : Creation
      
==================================================================================*/
//#region ********** GLOBALS      **************************************************
//
var myPTH = require('path');
var myHTP = require('http');
var myFSO = require('fs')  ;
var myURL = require('url') ; 
//
//#endregion
//#region ********** FUNCTIONS    **************************************************
//
function http_createServer_cb (oRequest, oResponse)  {
   /*-------------------------------------------------------------------------------*/
   /*-------------------------------------------------------------------------------*/
   //                                                                               -----------------------------------
   var d = myPTH.resolve(__dirname)           ;                                     //
   var p = myURL.parse(oRequest.url).pathname ;                                     //
   var f = p.replace('/', '\\')               ;                                     //
   //                                                                               -----------------------------------   
   if (f == '\\') { f = d + '\\index.html' ; }                                      // Set file location
   else           { f = d + f              ; }                                      //
   console.log('----------------------------------------------')  ;                 //
   console.log('Root [' + d + ']'                              )  ;                 //
   console.log('URL  [' + p + ']'                              )  ;                 //
   console.log('File [' + f + ']'                              )  ;                 //
   //                                                                               -----------------------------------   
	myFSO.readFile(f, function (oError, sText) {                                     // Return HTML
      var h = sText  ;                                                              //    HTML content
      var n = 200    ;                                                              //    Header code
      if (oError)    {                                                              //    Read file error
         n = 440                                                                    //
         h = '<HTML><BODY><H2>Page [' + p + ']not found</H2></BODY><HTML>'          //
      }                                                                             //
      if (h == '') { h = '<HTML><BODY><H2>No data</H2></BODY></HTML>' ; }           //    Empthy file
      oResponse.writeHeader(n, {"Content-Type": "text/html"})  ;                    //
      oResponse.write(h)                                       ;                    //
      oResponse.end()                                          ;                    //
   });                                                                              //
   //                                                                               -----------------------------------
}
//
//#endregion
//#region ********** ENTRY POINT ***************************************************
//
myHTP.createServer(http_createServer_cb).listen(8888);
//
//#endregion
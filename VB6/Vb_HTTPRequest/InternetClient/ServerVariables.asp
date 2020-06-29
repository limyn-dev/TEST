<HTML><HEAD></HEAD>
<BODY>
<%

For i = 1 To Request.QueryString.Count   
    Response.Write Request.QueryString(i) & "<BR>"
  Next
'response.write "Request = " & Request("ServerVars")
sSplit = split(Request("ServerVars"), ":")
for iCtr = 0 to uBound(sSplit)
  sVar = request.ServerVariables(sSplit(ictr))
  if sVar <> "" then sResponse = sResponse & sSplit(ictr) &  ": " & sVar &  "<P>" &  vbCrlf
Next
if sResponse = "" then sResponse = "No Server Variables matching your request exist on this server"
response.write sResponse
%>
</BODY>
</HTML>
 


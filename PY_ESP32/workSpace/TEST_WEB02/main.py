#
# ********** FINCTIONS *******************************
def RESPONCE_GET():
  html  = '<html>'
  html += '<head>' 
  html += '<title>ESP Web Server</title>'
  html += '<meta name="viewport" content="width=device-width, initial-scale=1">'
  html += '<link rel="icon" href="data:,">'
  html += '<style>'
  html += 'html{font-family: Helvetica   ; '
  html += '     display    : inline-block; '
  html += '     margin     : 0px auto    ; '
  html += '     text-align : center      ;}'
  html += 'h1  {color      : #0F3376     ; '
  html += '     padding    : 2vh         ;}'
  html += '</style>'
  html += '</head>'
  html += '<body>'
  html += '<h1>ESP Web Server</h1> '
  html += '<TABLE>'
  html += '<TR><TD>ADC1</TD><TD><strong>' + str(P34.read()) + '</strong></TD></TR>'
  html += '</TABLE>'
  html += '</body>'
  html += '</html>'
  return html
#
# ********** EMTRY POINT ****************************
print('main > START'                                )
#----------------------------------------------------
print('main > Init socket'                          )
SCK = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
SCK.bind(('', 80))
SCK.listen(5)
#----------------------------------------------------
while True:
  print('main > Wait HTTP request ...'              )
  C, A = SCK.accept()
  print('main > Got a connection from [' + str(A) + ']')
  C.send('HTTP/1.1 200 OK\n')
  C.send('Content-Type: text/html\n')
  C.send('Connection: close\n\n')
  C.sendall(RESPONCE_GET())
  C.close()
#----------------------------------------------------  
print('main > END'                                  )
#
#
#
function LoadTypes   {
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   [string] $S = ""                                                                 #
   #                                                                                -----------------------------------   
   $null=[System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms')  #
   #                                                                                -----------------------------------   
   #$S += 'using System                          ;                                '  #
   #$S += 'using System.Diagnostics              ;                                '  #
   #$S += 'using System.Runtime.InteropServices  ;                                '  #
   $S += '[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] '  #
   $S += 'public static extern bool SetForegroundWindow(                         '  #
   $S += '   IntPtr hWnd                                                         '  #
   $S += ');                                                                     '  #
   $S += '[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] '  #
   $S += 'public static extern bool ShowWindow(                                  '  #
   $S += '   IntPtr hWnd,                                                        '  #
   $S += '   int nCmdShow                                                        '  #
   $S += ');                                                                     '  #
   $S += '[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] '  #
   $S += 'public static extern IntPtr FindWindow(                                '  #
   $S += '   string lpClassName,                                                 '  #
   $S += '   string lpWindowName                                                 '  #
   $S += ');                                                                     '  #
   $S += '[DllImport("user32.dll", SetLastError = true, CharSet = CharSet.Auto)] '  #
   $S += 'public static extern IntPtr FindWindowEx(                              '  #
   $S += '   IntPtr hwndParent,                                                  '  #
   $S += '   IntPtr hwndChildAfter,                                              '  #
   $S += '   string lpszClass,                                                   '  #
   $S += '   string lpszWindow                                                   '  #
   $S += ');                                                                     '  #
   $S += '[DllImport("user32.dll", CharSet = CharSet.Auto)]                      '  #
   $S += 'public static extern IntPtr SendMessage(                               '  #
   $S += '   IntPtr hWnd,                                                        '  #
   $S += '   int    Msg,                                                         '  #
   $S += '   IntPtr wParam,                                                      '  #
   $S += '   string lParam                                                       '  #
   $S += ');                                                                     '  #
   #$S += '[DllImport("user32.dll", CharSet = CharSet.Auto)]                      '  #
   #$S += 'public static extern IntPtr SendMessage(                               '  #
   #$S += '   IntPtr hWnd,                                                        '  #
   #$S += '   int    wMsg,                                                        '  #
   #$S += '   IntPtr wParam,                                                      '  #
   #$S += '   IntPtr lParam                                                       '  #
   #$S += ');                                                                     '  #
   $S += '[DllImport("user32.dll")]                                              '  #
   $S += 'public static extern bool SetWindowText(                               '  #
   $S += '   IntPtr hWnd,                                                        '  #
   $S += '   string text                                                         '  #
   $S += ');                                                                     '  #
   Add-Type -MemberDefinition $S -Namespace 'API' -Name 'WIN'                       #      
   #                                                                                -----------------------------------      
}
function SendText    {
  param ( [IntPtr] $pHandle = 0
        , [string] $sString = "")
   #--------------------------------------------------------------------------------#
   #--------------------------------------------------------------------------------#
   #                                                                                -----------------------------------
   "Send string to [$($pHandle)][$($sString)] " | OUT-HOST                          #
   [API.WIN]::SendMessage($E, 0x000C, 0, $S)                                        #
   #                                                                                -----------------------------------   
}
function SendCommand {
  param ( [IntPtr] $pHandle  = 0 
        , [int]    $nCommand = 0)
   #--------------------------------------------------------------------------------#
   # 0x0010 WM_CLOSE                                                                #
   # 0x0002 WM_DESTROY                                                              #
   #--------------------------------------------------------------------------------#
   #                                                                                -----------------------------------
   "Send command to [$($pHandle)][$($nCommand)]" | OUT-HOST                         #
   [API.WIN]::SendMessage($E, $nCommand, 0, 0)                                      #      
   #                                                                                -----------------------------------   
}
#
#
#                                                                                   ----------------------------------------
LoadTypes                                                                           #
#                                                                                   ----------------------------------------
[string] $PTH = SPLIT-PATH -Path $MyInvocation.MyCommand.Definition -Parent         # Current script path
[string] $CMD = "$($PTH)\mmc.msc"                                                   #
[string] $CMD = "notepad.exe"                                                       #
#                                                                                   ----------------------------------------
"Run command [$($CMD)]" | OUT-HOST                                                  #
$P = Start-Process -FilePath $CMD -PassThru                                         # Start exe and capture process info
Start-Sleep -Seconds 2                                                              # Wait for program to start
#                                                                                   ----------------------------------------
$E = [API.WIN]::FindWindowEx($P.MainWindowHandle, 0, "MDIClient", $null)
$E = [API.WIN]::FindWindowEx($P.MainWindowHandle, 0, "RichEditD2DPT", $null)
SendText $E "Hello" 
SendText $P.MainWindowHandle "Hello" 


#                                                                                   ----------------------------------------
#"Close window" | OUT-HOST                                                           #
#SendCommand $P.MainWindowHandle 0x0010
#SendCommand $P.MainWindowHandle 0x0002
#                                                                                   ----------------------------------------



#Public Const WM_CHAR = &H102
#Public Const WM_SETTEXT = &HC
#Public Const WM_KEYDOWN = &H100
#Public Const WM_KEYUP = &H101
#Public Const WM_LBUTTONDOWN = &H201
#Public Const WM_LBUTTONUP = &H202
#Public Const WM_CLOSE = &H10
#Public Const WM_COMMAND = &H111
#Public Const WM_CLEAR = &H303
#Public Const WM_DESTROY = &H2
#Public Const WM_GETTEXT = &HD
#Public Const WM_GETTEXTLENGTH = &HE
#Public Const WM_LBUTTONDBLCLK = &H203

# Key  | Code
# -----------
# BACKSPACE   {BACKSPACE}, {BS}, or {BKSP}
# BREAK   {BREAK}
# CAPS LOCK   {CAPSLOCK}
# DEL or DELETE   {DELETE} or {DEL}
# DOWN ARROW  {DOWN}
# END {END}
# ENTER   {ENTER}or ~
# ESC {ESC}
# HELP    {HELP}
# HOME    {HOME}
# INS or INSERT   {INSERT} or {INS}
# LEFT ARROW  {LEFT}
# NUM LOCK    {NUMLOCK}
# PAGE DOWN   {PGDN}
# PAGE UP {PGUP}
# RIGHT ARROW {RIGHT}
# SCROLL LOCK {SCROLLLOCK}
# TAB {TAB}
# UP ARROW    {UP}
# F1  {F1}
# F2  {F2}
# F3  {F3}
# F4  {F4}
# F5  {F5}
# F6  {F6}
# F7  {F7}
# F8  {F8}
# F9  {F9}
# F10 {F10}
# F11 {F11}
# F12 {F12}
# F13 {F13}
# # # F14 {F14}
# F15 {F15}
# F16 {F16}
# Keypad add  {ADD}
# Keypad subtract {SUBTRACT}
# Keypad multiply {MULTIPLY}
# Keypad divide   {DIVIDE}
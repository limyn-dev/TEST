VERSION 5.00
Begin VB.UserControl CaptionButton 
   ClientHeight    =   744
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   1344
   ScaleHeight     =   744
   ScaleWidth      =   1344
   ToolboxBitmap   =   "ELLIPT~1.ctx":0000
   Begin VB.CommandButton Command1 
      Caption         =   "Button"
      Height          =   732
      Left            =   0
      Style           =   1  'Graphical
      TabIndex        =   0
      Top             =   0
      Width           =   1332
   End
End
Attribute VB_Name = "CaptionButton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = True
Dim CaptionColorVar As OLE_COLOR
Private colButtons As New Collection
Private Const KeyConst = "K"
Private Const FormName = "ThunderFormDC"
Private Const PROP_COLOR = "SMDColor"
Private Const PROP_HWNDPARENT = "SMDhWndParent"
Private Const PROP_LPWNDPROC = "SMDlpWndProc"
Private Const GWL_WNDPROC = -4
Private Const ODA_SELECT = &H2
Private Const ODS_SELECTED = &H1
Private Const ODS_FOCUS = &H10
Private Const ODS_BUTTONDOWN = ODS_FOCUS + ODS_SELECTED
Private Const WM_DESTROY = &H2
Private Const WM_DRAWITEM = &H2B

Private Type RECT
Left As Long
Top As Long
Right As Long
Bottom As Long
End Type

Private Type Size
cx As Long
cy As Long
End Type

Private Type DRAWITEMSTRUCT
CtlType As Long
CtlID As Long
itemID As Long
itemAction As Long
itemState As Long
hWndItem As Long
hDC As Long
rcItem As RECT
itemData As Long
End Type

Private Declare Function CallWindowProc Lib "user32" Alias "CallWindowProcA" _
(ByVal lpPrevWndFunc As Long, ByVal hWnd As Long, ByVal msg As Long, _
ByVal wParam As Long, lParam As DRAWITEMSTRUCT) As Long

Private Declare Function GetClassName Lib "user32" Alias "GetClassNameA" _
(ByVal hWnd As Long, ByVal lpClassName As String, _
ByVal nMaxCount As Long) As Long

Private Declare Function GetParent Lib "user32" (ByVal hWnd As Long) As Long

Private Declare Function GetProp Lib "user32" Alias "GetPropA" _
(ByVal hWnd As Long, ByVal lpString As String) As Long

Private Declare Function GetTextExtentPoint32 Lib "gdi32" Alias _
"GetTextExtentPoint32A" (ByVal hDC As Long, ByVal lpSz As String, _
ByVal cbString As Long, lpSize As Size) As Long

Private Declare Function RemoveProp Lib "user32" Alias "RemovePropA" _
(ByVal hWnd As Long, ByVal lpString As String) As Long

Private Declare Function SetProp Lib "user32" Alias "SetPropA" _
(ByVal hWnd As Long, ByVal lpString As String, ByVal hData As Long) As Long

Private Declare Function SetTextColor Lib "gdi32" _
(ByVal hDC As Long, ByVal crColor As Long) As Long

Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongA" _
(ByVal hWnd As Long, _
ByVal nIndex As Long, ByVal dwNewLong As Long) As Long

Private Declare Sub Sleep Lib "kernel32" (ByVal dwMilliseconds As Long)

Private Declare Function TextOut Lib "gdi32" Alias "TextOutA" _
(ByVal hDC As Long, ByVal x As Long, ByVal y As Long, _
ByVal lpString As String, ByVal nCount As Long) As Long

Private Function FindButton(sKey As String) As Boolean
Dim cmdButton As CommandButton
On Error Resume Next
Set cmdButton = colButtons.Item(sKey)
FindButton = (Err.Number = 0)
End Function

Private Function GetFormHandle(hWndButton As Long) As Long
Dim hWndParent As Long
Dim l As Long
Dim ClassName As String * 128
hWndParent = GetParent(hWndButton)
Do Until (hWndParent = 0)
l = GetClassName(hWndParent, ClassName, Len(ClassName))
If Left(ClassName, l) = FormName Then Exit Do
hWndParent = GetParent(hWndParent)
Loop
GetFormHandle = hWndParent
End Function

Private Function GetKey(hWnd As Long) As String
GetKey = KeyConst & hWnd
End Function

Private Function ProcessButton(ByVal hWnd As Long, _
ByVal uMsg As Long, ByVal wParam As Long, _
lParam As DRAWITEMSTRUCT, sKey As String) As Long
Dim cmdButton As CommandButton
Dim bRC As Boolean
Dim lRC As Long
Dim x As Long
Dim y As Long
Dim lpWndProc As Long
Dim lButtonWidth As Long
Dim lButtonHeight As Long
Dim lPrevColor As Long
Dim lColor As Long
Dim TextSize As Size
Dim sCaption As String
Const PushOffset = 2
Set cmdButton = colButtons.Item(sKey)
sCaption = cmdButton.Caption
lColor = GetProp(cmdButton.hWnd, PROP_COLOR)
lPrevColor = SetTextColor(lParam.hDC, lColor)
lRC = GetTextExtentPoint32(lParam.hDC, _
sCaption, Len(sCaption), TextSize)
lButtonHeight = lParam.rcItem.Bottom - lParam.rcItem.Top
lButtonWidth = lParam.rcItem.Right - lParam.rcItem.Left
If (lParam.itemAction = ODA_SELECT) And (lParam.itemState = ODS_BUTTONDOWN) Then
cmdButton.SetFocus
DoEvents
x = (lButtonWidth - TextSize.cx + PushOffset) \ 2
y = (lButtonHeight - TextSize.cy + PushOffset) \ 2
Else
x = (lButtonWidth - TextSize.cx) \ 2
y = (lButtonHeight - TextSize.cy) \ 2
End If
lpWndProc = GetProp(hWnd, PROP_LPWNDPROC)
ProcessButton = CallWindowProc(lpWndProc, hWnd, uMsg, wParam, lParam)
bRC = TextOut(lParam.hDC, x, y, sCaption, Len(sCaption))
lRC = SetTextColor(lParam.hDC, lPrevColor)
ProcessButton_Exit:
Set cmdButton = Nothing
End Function

Private Sub RemoveForm(hWndParent As Long)
Dim hWndButton As Long
Dim i As Integer
UnsubclassForm hWndParent
On Error GoTo RemoveForm_Exit
For i = colButtons.Count - 1 To 0 Step -1
hWndButton = colButtons(i).hWnd
If GetProp(hWndButton, PROP_HWNDPARENT) = hWndParent Then
RemoveProp hWndButton, PROP_COLOR
RemoveProp hWndButton, PROP_HWNDPARENT
colButtons.Remove i
End If
Next i
RemoveForm_Exit:
Exit Sub
End Sub

Private Function UnsubclassForm(hWnd As Long) As Boolean
Dim lRC As Long
Dim lpWndProc As Long
lpWndProc = GetProp(hWnd, PROP_LPWNDPROC)
If lpWndProc = 0 Then
UnsubclassForm = False
Else
lRC = SetWindowLong(hWnd, GWL_WNDPROC, lpWndProc)
RemoveProp hWnd, PROP_LPWNDPROC
UnsubclassForm = True
End If
End Function

Private Function WindowProc(ByVal hWnd As Long, ByVal uMsg As Long, _
ByVal wParam As Long, lParam As DRAWITEMSTRUCT) As Long
Dim lpWndProc As Long
Dim bProcessButton As Boolean
Dim sButtonKey As String
bProcessButton = False
If (uMsg = WM_DRAWITEM) Then
sButtonKey = GetKey(lParam.hWndItem)
bProcessButton = FindButton(sButtonKey)
End If
If bProcessButton Then
ProcessButton hWnd, uMsg, wParam, lParam, sButtonKey
Else
lpWndProc = GetProp(hWnd, PROP_LPWNDPROC)
WindowProc = CallWindowProc(lpWndProc, hWnd, uMsg, wParam, lParam)
If uMsg = WM_DESTROY Then RemoveForm hWnd
End If
End Function

Private Function RegisterButton(Button As CommandButton, Forecolor As Long)
Dim hWndParent As Long
Dim lpWndProc As Long
Dim sButtonKey As String
sButtonKey = GetKey(Button.hWnd)
If FindButton(sButtonKey) Then
SetProp Button.hWnd, PROP_COLOR, Forecolor
Button.Refresh
Else
hWndParent = GetFormHandle(Button.hWnd)
If (hWndParent = 0) Then
RegisterButton = False
Exit Function
End If
colButtons.Add Button, sButtonKey
SetProp Button.hWnd, PROP_COLOR, Forecolor
SetProp Button.hWnd, PROP_HWNDPARENT, hWndParent
lpWndProc = GetProp(hWndParent, PROP_LPWNDPROC)
If (lpWndProc = 0) Then
lpWndProc = SetWindowLong(hWndParent, _
GWL_WNDPROC, AddressOf WindowProc)
SetProp hWndParent, PROP_LPWNDPROC, lpWndProc
End If
End If
RegisterButton = True
End Function

Private Function UnregisterButton(Button As CommandButton) As Boolean
Dim hWndParent As Long
Dim sKeyButton As String
sKeyButton = GetKey(Button.hWnd)
If (FindButton(sKeyButton) = False) Then
UnregisterButton = False
Exit Function
End If
hWndParent = GetProp(Button.hWnd, PROP_HWNDPARENT)
UnregisterButton = UnsubclassForm(hWndParent)
colButtons.Remove sKeyButton
RemoveProp Button.hWnd, PROP_COLOR
RemoveProp Button.hWnd, PROP_HWNDPARENT
End Function
Event Click()
Event KeyDown(KeyCode As Integer, Shift As Integer)
Event KeyPress(KeyAscii As Integer)
Event KeyUp(KeyCode As Integer, Shift As Integer)
Event MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
Event MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
Event MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
Dim Temp As String, Code As String, DataString As String
Private Sub Command1_Click()
RaiseEvent Click
End Sub

Public Sub AboutBox()
Attribute AboutBox.VB_UserMemId = -552
MsgBox "This Control Is FreeWare. If you got any questions or suggestions E-mail us to VBActiveX@hotmail.com" + Chr(13) + "Check For Updates and new controls at Go.To/VBHelp", , "About this control"
End Sub

Private Sub Command1_KeyDown(KeyCode As Integer, Shift As Integer)
RaiseEvent KeyDown(KeyCode, Shift)
End Sub

Private Sub Command1_KeyPress(KeyAscii As Integer)
RaiseEvent KeyPress(KeyAscii)
End Sub

Private Sub Command1_KeyUp(KeyCode As Integer, Shift As Integer)
RaiseEvent KeyUp(KeyCode, Shift)
End Sub

Private Sub Command1_MouseDown(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent MouseDown(Button, Shift, x, y)
End Sub

Private Sub Command1_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent MouseMove(Button, Shift, x, y)
End Sub

Private Sub Command1_MouseUp(Button As Integer, Shift As Integer, x As Single, y As Single)
RaiseEvent MouseUp(Button, Shift, x, y)
End Sub


Private Sub UserControl_Initialize()
CaptionColorVar = vbBlack
End Sub

Private Sub UserControl_Resize()
Command1.Width = UserControl.Width
Command1.Height = UserControl.Height
End Sub

Public Property Get BackColor() As OLE_COLOR
    BackColor = Command1.BackColor
End Property

Public Property Let BackColor(ByVal New_BackColor As OLE_COLOR)
    Command1.BackColor() = New_BackColor
    PropertyChanged "BackColor"
End Property

Public Property Get CaptionColor() As OLE_COLOR
    CaptionColor = CaptionColorVar
End Property

Public Property Let CaptionColor(ByVal New_CaptionColor As OLE_COLOR)
    CaptionColorVar = New_CaptionColor
    RegisterButton Command1, CaptionColorVar
    PropertyChanged "CaptionColor"
End Property

Public Property Get Enabled() As Boolean
    Enabled = Command1.Enabled
End Property

Public Property Let Enabled(ByVal New_Enabled As Boolean)
    Command1.Enabled() = New_Enabled
    PropertyChanged "Enabled"
End Property

Public Property Get Font() As Font
    Set Font = Command1.Font
End Property
Public Property Set Picture(ByVal New_Picture As Picture)
    Set Command1.Picture = New_Picture
    PropertyChanged "Picture"
End Property
Public Property Set DisabledPicture(ByVal New_DisabledPicture As Picture)
    Set Command1.DisabledPicture = New_DisabledPicture
    PropertyChanged "DisabledPicture"
End Property
Public Property Get Picture() As Picture
     Set Picture = Command1.Picture
End Property
Public Property Get DisabledPicture() As Picture
     Set DisabledPicture = Command1.DisabledPicture
End Property
Public Property Set Font(ByVal New_Font As Font)
    Set Command1.Font = New_Font
    PropertyChanged "Font"
End Property
Public Property Get DownPicture() As Picture
     Set DownPicture = Command1.DownPicture
End Property
Public Property Set DownPicture(ByVal New_DownPicture As Picture)
    Set Command1.DownPicture = New_DownPicture
    PropertyChanged "DownPicture"
End Property

Public Property Get MousePointer() As MousePointerConstants
    MousePointer = Command1.MousePointer
End Property
Public Property Let MousePointer(ByVal New_MousePointer As MousePointerConstants)
    Command1.MousePointer() = New_MousePointer
    PropertyChanged "MousePointer"
End Property
Public Property Get MouseIcon() As Picture
    Set MouseIcon = Command1.MouseIcon
End Property

Public Property Set MouseIcon(ByVal New_MouseIcon As Picture)
    Set Command1.MouseIcon() = New_MouseIcon
    PropertyChanged "MouseIcon"
End Property

Public Property Get Caption() As String
    Caption = Command1.Caption
End Property

Public Property Let Caption(ByVal New_Caption As String)
    Command1.Caption() = New_Caption
    PropertyChanged "Caption"
End Property

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
    Command1.BackColor = PropBag.ReadProperty("BackColor", &H8000000F)
    CaptionColorVar = PropBag.ReadProperty("CaptionColor", &H80000012)
    Command1.Enabled = PropBag.ReadProperty("Enabled", True)
    Set Font = PropBag.ReadProperty("Font", Ambient.Font)
    Set Picture = PropBag.ReadProperty("Picture", "")
    Set DisabledPicture = PropBag.ReadProperty("DisabledPicture", "")
    Set DownPicture = PropBag.ReadProperty("DownPicture", "")
    Command1.MousePointer = PropBag.ReadProperty("MousePointer", 0)
    Set MouseIcon = PropBag.ReadProperty("MouseIcon", "")
    Command1.Caption = PropBag.ReadProperty("Caption", "Button")
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
    Call PropBag.WriteProperty("BackColor", Command1.BackColor, &H8000000F)
    Call PropBag.WriteProperty("CaptionColor", CaptionColorVar, &H80000012)
    Call PropBag.WriteProperty("Enabled", Command1.Enabled, True)
    Call PropBag.WriteProperty("Font", Font, Ambient.Font)
    Call PropBag.WriteProperty("Picture", Picture, "")
    Call PropBag.WriteProperty("DisabledPicture", DisabledPicture, "")
    Call PropBag.WriteProperty("DownPicture", DownPicture, "")
    Call PropBag.WriteProperty("MousePointer", Command1.MousePointer, 0)
    Call PropBag.WriteProperty("MouseIcon", Command1.MouseIcon, "")
    Call PropBag.WriteProperty("Caption", Command1.Caption, "Button")
End Sub



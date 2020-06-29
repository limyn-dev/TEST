VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CCboBox"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3C88D99D024E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'##ModelId=3C88D9BE006E
Implements CWndClass

'##ModelId=3C88DD2F006E
Private mCObjetObject As New CWndClass

'##ModelId=3C8937B500DC
Private Property Get CWndClass_Handel() As Long
    CWndClass_Handel = mCObjetObject.Handel
End Property

'##ModelId=3C8937B5014A
Private Property Let CWndClass_Handel(ByVal vNewValue As Long)
    mCObjetObject.Handel = vNewValue
End Property

'##ModelId=3C88DD370014
Private Sub Class_Initialize()

End Sub

'##ModelId=3C88DD3703C0
Private Sub Class_Terminate()

End Sub

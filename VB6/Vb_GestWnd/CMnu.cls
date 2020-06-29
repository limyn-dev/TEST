VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMnu"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"3C88D90B0032"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'##ModelId=3C88D9B40226
Implements CWndClass

'##ModelId=3C88DDD200F0
Private mCObjetObject As New CWndClass

'##ModelId=3C8937B30168
Private Property Get CWndClass_Handel() As Long
    CWndClass_Handel = mCObjetObject.Handel
End Property

'##ModelId=3C8937B301D7
Private Property Let CWndClass_Handel(ByVal vNewValue As Long)
    mCObjetObject.Handel = vNewValue
End Property

'##ModelId=3C88DDD40262
Private Sub Class_Terminate()

End Sub

'##ModelId=3C88DDD5024E
Private Sub Class_Initialize()

End Sub

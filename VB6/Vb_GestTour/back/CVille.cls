VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CVille"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399C5E3703AC"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Option Explicit

'##ModelId=399C70AF0032
Private mId As Long

'##ModelId=399C70B40366
Private mNom As String

'##ModelId=399DA1D70244
Private Sub Class_Initialize()

End Sub

'##ModelId=399DA1D80078
Private Sub Class_Terminate()

End Sub

'##ModelId=399DA1DA010E
Public Property Get Id() As Long
    Id = mId
End Property

'##ModelId=399DA1F8024E
Public Property Let Id(ByVal vNewValue As Long)
    mId = vNewValue
End Property

'##ModelId=399DA20301CC
Public Property Get Nom() As String
    Nom = mNom
End Property

'##ModelId=399DA20E0230
Public Property Let Nom(ByVal vNewValue As String)
    mNom = vNewValue
End Property

VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTypeOrganisme"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DA00C029E"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit



'##ModelId=399DA02402A8
Private mId As Long
'##ModelId=399DA0280208
Private mDesignation As String



' Id
'------------------------------------------------------------------------------
'##ModelId=39A39A240136
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=39A39A2400C8
Public Property Let Id(ByVal vNewvalue As Long)
    mId = vNewvalue
End Property

' Designation
'------------------------------------------------------------------------------
'##ModelId=39A39A2401E1
Public Property Get Designation() As String
    Designation = mDesignation
End Property
'##ModelId=39A39A240175
Public Property Let Designation(ByVal vNewvalue As String)
    mDesignation = vNewvalue
End Property




'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A39A240244
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    mId = 0
    mDesignation = "Pas de données"
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A39A240280
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
End Sub

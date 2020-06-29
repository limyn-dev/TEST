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
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'##ModelId=399C70AF0032
Private mId As Long
'##ModelId=399C70B40366
Private mNom As String
'##ModelId=39A6E49600FB
Private mOrganismes As COrganismes 'local copy



' Id
'------------------------------------------------------------------------------
'##ModelId=39A39A3300FA
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=39A39A33005A
Public Property Let Id(ByVal vNewvalue As Long)
    mId = vNewvalue
End Property

' Nom
'------------------------------------------------------------------------------
'##ModelId=399DA20301CC
Public Property Get nom() As String
    nom = mNom
End Property
'##ModelId=399DA20E0230
Public Property Let nom(ByVal vNewvalue As String)
    mNom = vNewvalue
End Property

' Organismes
'------------------------------------------------------------------------------
'##ModelId=39A6E49603CA
Public Property Get Organismes() As COrganismes
    Set Organismes = mOrganismes
End Property
'##ModelId=39A6E4960320
Public Property Set Organismes(ByRef vNewvalue As COrganismes)
    Set mOrganismes = Nothing
    Set mOrganismes = vNewvalue
End Property




'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DA1D70244
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    mId = 0
    mNom = "Pas de données"
    Set mOrganismes = New COrganismes
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DA1D80078
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mOrganismes = Nothing
End Sub



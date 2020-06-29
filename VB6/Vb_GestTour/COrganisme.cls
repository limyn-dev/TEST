VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "COrganisme"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399D9F3F008C"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit



'##ModelId=399D9F6E0032
Private mId As Long
'##ModelId=399D9F890082
Private mNom As String
'##ModelId=399D9F9E0370
Private mAdresse As String
'##ModelId=399D9FAD0064
Private mTel As String
'##ModelId=399EB1370104
Private mTypeOrganisme As CTypeOrganisme



' Id
'------------------------------------------------------------------------------
'##ModelId=39A39A250277
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=39A39A250208
Public Property Let Id(ByVal vNewvalue As Long)
    mId = vNewvalue
End Property

' Nom
'------------------------------------------------------------------------------
'##ModelId=39A39A250352
Public Property Get nom() As String
    nom = mNom
End Property
'##ModelId=39A39A2502E4
Public Property Let nom(ByVal vNewvalue As String)
    mNom = vNewvalue
End Property

' Adresse
'------------------------------------------------------------------------------
'##ModelId=39A39A260078
Public Property Get Adresse() As String
    Adresse = mAdresse
End Property
'##ModelId=39A39A2503C0
Public Property Let Adresse(ByVal vNewvalue As String)
    mAdresse = vNewvalue
End Property

' Tel
'------------------------------------------------------------------------------
'##ModelId=39A39A260154
Public Property Get Tel() As String
    Tel = mTel
End Property
'##ModelId=39A39A2600B5
Public Property Let Tel(ByVal vNewvalue As String)
    mTel = vNewvalue
End Property

' TypeOrganisme
'------------------------------------------------------------------------------
'##ModelId=39A39A26037A
Public Property Get TypeOrganisme() As CTypeOrganisme
    Set TypeOrganisme = mTypeOrganisme
End Property
'##ModelId=39A6E48C01E0
Public Property Set TypeOrganisme(ByRef vNewvalue As CTypeOrganisme)
    Set mTypeOrganisme = Nothing
    Set mTypeOrganisme = vNewvalue
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A39A270000
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    mId = 0
    mNom = "Pas de données"
    mAdresse = "Pas de données"
    mTel = "Pas de données"
    Set mTypeOrganisme = New CTypeOrganisme
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A39A27003C
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mTypeOrganisme = Nothing
End Sub



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
Option Explicit



'##ModelId=399D9F6E0032
Private mId As Long
'##ModelId=399D9F890082
Private mNom As String
'##ModelId=399D9F9E0370
Private mAdresse As String
'##ModelId=399D9FAD0064
Private mTel As String
'##ModelId=399D9FC80348
Private mVille As CVille
'##ModelId=399EB1370104
Private mTypeOrganisme As CTypeOrganisme



' Id
'------------------------------------------------------------------------------
Public Property Get Id() As Long
    Id = mId
End Property
Public Property Let Id(ByVal vNewValue As Long)
    mId = vNewValue
End Property

' Nom
'------------------------------------------------------------------------------
Public Property Get Nom() As String
    Nom = mNom
End Property
Public Property Let Nom(ByVal vNewValue As String)
    mNom = vNewValue
End Property

' Adresse
'------------------------------------------------------------------------------
Public Property Get Adresse() As String
    Adresse = mAdresse
End Property
Public Property Let Adresse(ByVal vNewValue As String)
    mAdresse = vNewValue
End Property

' Tel
'------------------------------------------------------------------------------
Public Property Get Tel() As String
    Tel = mTel
End Property
Public Property Let Tel(ByVal vNewValue As String)
    mTel = vNewValue
End Property

' Ville
'------------------------------------------------------------------------------
Public Property Get Ville() As CVille
    Set Ville = mVille
End Property
Public Property Let Ville(ByVal vNewValue As CVille)
    Set mVille = vNewValue
End Property

' TypeOrganisme
'------------------------------------------------------------------------------
Public Property Get TypeOrganisme() As CTypeOrganisme
    Set TypeOrganisme = mTypeOrganisme
End Property
Public Property Let TypeOrganisme(ByVal vNewValue As CTypeOrganisme)
    Set mTypeOrganisme = vNewValue
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()

End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
    Set mVille = Nothing
    Set mTypeOrganisme = Nothing
End Sub

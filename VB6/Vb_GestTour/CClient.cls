VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CClient"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399C5E0902B2"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'##ModelId=399C6F1C003C
Private mId As Long
'##ModelId=399C6F270064
Private mNom As String
'##ModelId=399C6F2A030C
Private mPrenom As String
'##ModelId=399C6F2F00AA
Private mAdresse As String
'##ModelId=399C6F350258
Private mTel As String

' Id
'------------------------------------------------------------------------------
'##ModelId=399C70710104
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=399C70720050
Public Property Let Id(ByVal vNewvalue As Long)
    mId = vNewvalue
End Property

' Nom
'------------------------------------------------------------------------------
'##ModelId=399C70750140
Public Property Let nom(ByVal vNewvalue As String)
    mNom = vNewvalue
End Property
'##ModelId=399C7076005A
Public Property Get nom() As String
    nom = mNom
End Property

' Prenom
'------------------------------------------------------------------------------
'##ModelId=399C7078037A
Public Property Get prenom() As String
    prenom = mPrenom
End Property
'##ModelId=399C707901B8
Public Property Let prenom(ByVal vNewvalue As String)
    mPrenom = vNewvalue
End Property

' Adresse
'------------------------------------------------------------------------------
'##ModelId=399C706E0046
Public Property Get Adresse() As String
    Adresse = mAdresse
End Property
'##ModelId=399C706E029E
Public Property Let Adresse(ByVal vNewvalue As String)
    mAdresse = vNewvalue
End Property

' Tel
'------------------------------------------------------------------------------
'##ModelId=399C707D01F4
Public Property Get Tel() As String
    Tel = mTel
End Property
'##ModelId=399C707E01B8
Public Property Let Tel(ByVal vNewvalue As String)
    mTel = vNewvalue
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399C6E01008C
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    mId = 0
    mNom = "Pas de données"
    mPrenom = "Pas de données"
    mAdresse = "Pas de données"
    mTel = "pas de données"
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399C6E01038E
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
End Sub


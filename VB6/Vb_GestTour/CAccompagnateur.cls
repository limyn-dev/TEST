VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CAccompagnateur"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399C5E87008C"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'##ModelId=399C6F770230
Private mId As Long
'##ModelId=399C6F7B0384
Private mNom As String
'##ModelId=399C6F82010E
Private mPrenom As String
'##ModelId=399C6F8603AC
Private mAdresse As String
'##ModelId=399C6F8C0302
Private mTel As String

' Id
'------------------------------------------------------------------------------
'##ModelId=399C6FCB01EA
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=399C6FCC0028
Public Property Let Id(ByVal vNewvalue As Long)
    mId = vNewvalue
End Property

' Nom
'------------------------------------------------------------------------------
'##ModelId=399C6FCF003C
Public Property Get nom() As String
    nom = mNom
End Property
'##ModelId=399C6FCF0294
Public Property Let nom(ByVal vNewvalue As String)
    mNom = vNewvalue
End Property

' Prenom
'------------------------------------------------------------------------------
'##ModelId=399C6FD40302
Public Property Get prenom() As String
    prenom = mPrenom
End Property
'##ModelId=399C6FD50140
Public Property Let prenom(ByVal vNewvalue As String)
    mPrenom = vNewvalue
End Property

' Adresse
'------------------------------------------------------------------------------
'##ModelId=399C6FC603DE
Public Property Get Adresse() As String
    Adresse = mAdresse
End Property
'##ModelId=399C6FC702F8
Public Property Let Adresse(ByVal vNewvalue As String)
    mAdresse = vNewvalue
End Property

' Tel
'------------------------------------------------------------------------------
'##ModelId=399C6FD802DA
Public Property Get Tel() As String
    Tel = mTel
End Property
'##ModelId=399C6FD90118
Public Property Let Tel(ByVal vNewvalue As String)
    mTel = vNewvalue
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399C6FBF0014
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    mId = 0
    mNom = "Pas de données"
    mPrenom = "Pas de données"
    mAdresse = "Pas de données"
    mTel = "Pas de données"
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399C6FBF0208
Private Sub Class_Terminate()
End Sub


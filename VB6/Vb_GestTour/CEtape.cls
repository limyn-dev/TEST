VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CEtape"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DB25D0118"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'##ModelId=399DB2690320
Private mId As Long
'##ModelId=399DB29B02A8
Private mNumero As Integer
'##ModelId=399DB27A0262
Private mArriveeHeure As Date
'##ModelId=399DB283037A
Private mDepartHeure As Date
'##ModelId=399DB2920262
Private mVille As CVille
'##ModelId=39A6E48800BF
Private mContacts As COrganismes

' Id
'------------------------------------------------------------------------------
'##ModelId=39A39A2200DD
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=39A39A22006E
Public Property Let Id(ByVal vNewvalue As Long)
    mId = vNewvalue
End Property

' Numero
'------------------------------------------------------------------------------
'##ModelId=39A39A2201B9
Public Property Get Numero() As Integer
    Numero = mNumero
End Property
'##ModelId=39A39A22014A
Public Property Let Numero(ByVal vNewvalue As Integer)
    mNumero = vNewvalue
End Property

' ArriveeHeure
'------------------------------------------------------------------------------
'##ModelId=39A39A220295
Public Property Get ArriveeHeure() As Date
    ArriveeHeure = mArriveeHeure
End Property
'##ModelId=39A39A220226
Public Property Let ArriveeHeure(ByVal vNewvalue As Date)
    mArriveeHeure = vNewvalue
End Property

' DepartHeure
'------------------------------------------------------------------------------
'##ModelId=39A39A2203AC
Public Property Get DepartHeure() As Date
    DepartHeure = mDepartHeure
End Property
'##ModelId=39A39A220303
Public Property Let DepartHeure(ByVal vNewvalue As Date)
    mDepartHeure = vNewvalue
End Property

' Ville
'------------------------------------------------------------------------------
'##ModelId=39A39A2300D2
Public Property Get ville() As CVille
    Set ville = mVille
End Property
'##ModelId=39A39A230032
Public Property Set ville(ByRef vNewvalue As CVille)
    Set mVille = Nothing
    Set mVille = vNewvalue
End Property

' Contacts
'------------------------------------------------------------------------------
'##ModelId=39A6E4890230
Public Property Get Contacts() As COrganismes
Attribute Contacts.VB_Description = " Contacts\r\n------------------------------------------------------------------------------"
    Set Contacts = mContacts
End Property


'******************************************************************************


' Instanciation
'------------------------------------------------------------------------------
'##ModelId=39A39A230140
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    mId = 0
    mNumero = 0
    mArriveeHeure = 0
    mDepartHeure = 0
    Set mVille = New CVille
    Set mContacts = New COrganismes
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=39A39A23017C
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mVille = Nothing
    Set mContacts = Nothing
End Sub

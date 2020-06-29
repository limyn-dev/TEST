VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CCircuit"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399C5E670262"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

'##ModelId=399D9BE20348
Private mId As Long
'##ModelId=399D9C38038E
Private mIntitule As String
'##ModelId=399D9C4F0258
Private mPrix As Integer
'##ModelId=399D9C690208
Private mNombrePlace As Integer
'##ModelId=399DB36602A8
Private mEtapes As CEtapes
'##ModelId=399D9EE7028A
Private mAccompagnateur As CAccompagnateur
'##ModelId=399DA8F601B8
Private mParticipants As CParticipants



' Id
'------------------------------------------------------------------------------
'##ModelId=39A39A3401FF
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=39A39A34015E
Public Property Let Id(ByVal vNewvalue As Long)
    mId = vNewvalue
End Property

' Intitule
'------------------------------------------------------------------------------
'##ModelId=399DA85200DC
Public Property Get Intitule() As String
    Intitule = mIntitule
End Property
'##ModelId=399DA863012C
Public Property Let Intitule(ByVal vNewvalue As String)
    mIntitule = vNewvalue
End Property

' Prix
'------------------------------------------------------------------------------
'##ModelId=399DA857021C
Public Property Get Prix() As Integer
    Prix = mPrix
End Property
'##ModelId=399DA86001F4
Public Property Let Prix(ByVal vNewvalue As Integer)
    mPrix = vNewvalue
End Property

' Nombre de places
'------------------------------------------------------------------------------
'##ModelId=39A39A3501F4
Public Property Get NombrePlace() As Integer
    NombrePlace = mNombrePlace
End Property
'##ModelId=39A39A350118
Public Property Let NombrePlace(ByVal vNewvalue As Integer)
    mNombrePlace = vNewvalue
End Property

' Accompagnateur
'------------------------------------------------------------------------------
'##ModelId=39A39A35037A
Public Property Get accompagnateur() As CAccompagnateur
    Set accompagnateur = mAccompagnateur
End Property
'##ModelId=39A39A350263
Public Property Set accompagnateur(ByVal vNewvalue As CAccompagnateur)
    Set mAccompagnateur = Nothing
    Set mAccompagnateur = vNewvalue
End Property

' Liste des participants
'------------------------------------------------------------------------------
'##ModelId=399DA933001E
Public Property Get Participants() As CParticipants
    Set Participants = mParticipants
End Property
'##ModelId=399DA93400B4
Public Property Set Participants(ByRef vNewvalue As CParticipants)
    Set mParticipants = Nothing
    Set mParticipants = vNewvalue
End Property

' Liste des étapes
'------------------------------------------------------------------------------
'##ModelId=39A39A360258
Public Property Get Etapes() As CEtapes
    Set Etapes = mEtapes
End Property
'##ModelId=39A39A36017C
Public Property Set Etapes(ByRef vNewvalue As CEtapes)
    Set mEtapes = Nothing
    Set mEtapes = vNewvalue
End Property



'******************************************************************************



' Instaciation
'------------------------------------------------------------------------------
'##ModelId=399D9CF0035C
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instaciation\r\n------------------------------------------------------------------------------"
    mId = 0
    mIntitule = "Pas de données"
    mPrix = 0
    mNombrePlace = 0
    Set mAccompagnateur = New CAccompagnateur
    Set mParticipants = New CParticipants
    Set mEtapes = New CEtapes
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399D9CF101CC
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    Set mParticipants = Nothing
    Set mEtapes = Nothing
    Set mAccompagnateur = Nothing
End Sub

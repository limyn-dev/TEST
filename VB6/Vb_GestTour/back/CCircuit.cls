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
Option Explicit

'##ModelId=399D9BE20348
Private mId As Long
'##ModelId=399D9C38038E
Private mIntitule As String
'##ModelId=399D9C4F0258
Private mPrix As Integer
'##ModelId=399D9C690208
Private mNmbrePlace As Integer
'##ModelId=399DB36602A8
Private mEtapes As CEtapes
'##ModelId=399D9EE7028A
Private mAccompagnateur As CAccompagnateur
'##ModelId=399DA8F601B8
Private mParticipants As CClients


' Id
'------------------------------------------------------------------------------
'##ModelId=399DA85000B4
Public Property Get Id() As Long
    Id = mId
End Property
'##ModelId=399DA8640122
Public Property Let Id(ByVal vNewValue As Long)
    mId = vNewValue
End Property

' Intitule
'------------------------------------------------------------------------------
'##ModelId=399DA85200DC
Public Property Get Intitule() As String
    Intitule = mIntitule
End Property
'##ModelId=399DA863012C
Public Property Let Intitule(ByVal vNewValue As String)
    mIntitule = vNewValue
End Property

' Prix
'------------------------------------------------------------------------------
'##ModelId=399DA857021C
Public Property Get Prix() As Integer
    Prix = mPrix
End Property
'##ModelId=399DA86001F4
Public Property Let Prix(ByVal vNewValue As Integer)
    mPrix = vNewValue
End Property

' Nombre de places
'------------------------------------------------------------------------------
'##ModelId=399DA854038E
Public Property Get NombrePlace() As Integer
    NmbrePlace = mNmbrePlace
End Property
'##ModelId=399DA86103D4
Public Property Let NombrePlace(ByVal vNewValue As Integer)
    mNmbrePlace = vNewValue
End Property

' Accompagnateur
'------------------------------------------------------------------------------
'##ModelId=399DA84502B2
Public Property Get Accompagnateur() As CAccompagnateur
    Set Accompagnateur = mAccompagnateur
End Property
'##ModelId=399DA86600D2
Public Property Set Accompagnateur(ByVal vNewValue As CAccompagnateur)
    Set mAccompagnateur = vNewValue
End Property

' Liste des participants
'------------------------------------------------------------------------------
'##ModelId=399DA933001E
Public Property Get Participants() As CClients
    Set Participants = mParticipants
End Property
'##ModelId=399DA93400B4
Public Property Set Participants(ByVal vNewValue As CClients)
    Set mParticipants = vNewValue
End Property

' Liste des étapes
'------------------------------------------------------------------------------
'##ModelId=399DB3870168
Public Property Set Etapes(ByVal vNewValue As CEtapes)
    Set mEtapes = vNewValue
End Property
'##ModelId=399DB387038E
Public Property Get Etapes() As CEtapes
    Set Etapes = mEtapes
End Property



'******************************************************************************


' Instaciation
'------------------------------------------------------------------------------
'##ModelId=399D9CF0035C
Private Sub Class_Initialize()
    
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399D9CF101CC
Private Sub Class_Terminate()
    Set myparticipants = Nothing
    Set myetapes = Nothing
    Set myaccompagnateur = Nothing
End Sub

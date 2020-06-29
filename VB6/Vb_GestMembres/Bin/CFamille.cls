VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CFamille"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Option Explicit

' Membres
Private mvarId As Integer       ' local copy
Private mvarNom As String       ' local copy
Private mvarAdresse As String   ' local copy
Private mvarMembres As CMembres ' local copy

' Membres de la famille
'------------------------------------------------------------------------------
Public Property Set Membres(ByVal vData As CMembres)
    Set mvarMembres = Nothing
    Set mvarMembres = vData
End Property
Public Property Get Membres() As CMembres
    Set Membres = mvarMembres
End Property

' Adresse de la famille
'------------------------------------------------------------------------------
Public Property Let Adresse(ByVal vData As String)
    mvarAdresse = vData
End Property
Public Property Get Adresse() As String
    Adresse = mvarAdresse
End Property

' Nom de la famille
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal vData As String)
    mvarNom = vData
End Property
Public Property Get Nom() As String
    Nom = mvarNom
End Property

' Identifiant de la famille
'------------------------------------------------------------------------------
Public Property Let Id(ByVal vData As Integer)
    mvarId = vData
End Property
Public Property Get Id() As Integer
    Id = mvarId
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    mvarNom = "NO DATA"
    mvarAdresse = "NO DATA"
    Set mvarMembres = New CMembres
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
    Set mvarMembres = Nothing
End Sub

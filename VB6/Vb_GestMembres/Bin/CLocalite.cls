VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CLocalite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private mvarId As Integer 'local copy
Private mvarNom As String 'local copy
Private mvarNPA As Integer 'local copy
Private mvarFamilles As CFamilles 'local copy

' Identifiant de la localité
'------------------------------------------------------------------------------
Public Property Let Id(ByVal vData As Integer)
    mvarId = vData
End Property
Public Property Get Id() As Integer
    Id = mvarId
End Property

' Nom de la localité
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal vData As String)
    mvarNom = vData
End Property
Public Property Get Nom() As String
    Nom = mvarNom
End Property

' Numéro postal de la localité
'------------------------------------------------------------------------------
Public Property Let NPA(ByVal vData As Integer)
    mvarNPA = vData
End Property
Public Property Get NPA() As Integer
    NPA = mvarNPA
End Property

' Liste des famille qui habitent la localité
'------------------------------------------------------------------------------
Public Property Set Familles(ByVal vData As CFamilles)
    Set mvarFamilles = Nothing
    Set mvarFamilles = vData
End Property
Public Property Get Familles() As CFamilles
    Set Familles = mvarFamilles
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    mvarId = 0
    mvarNom = "NO DATA"
    mvarNPA = 0
    Set mvarFamilles = New CFamilles
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
    Set mvarFamilles = Nothing
End Sub

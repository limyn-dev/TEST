VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMembre"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private mvarId As Integer       ' local copy
Private mvarPrenom As String    ' local copy
Private mvarNaissance As Date   ' local copy
Private mvarRoles As CRoles     ' local copy

' Identifiant du membre
'------------------------------------------------------------------------------
Public Property Let Id(ByVal vData As Integer)
    mvarId = vData
End Property
Public Property Get Id() As Integer
    Id = mvarId
End Property

' Prénom du membre
'------------------------------------------------------------------------------
Public Property Let Prenom(ByVal vData As String)
    mvarPrenom = vData
End Property
Public Property Get Prenom() As String
    Prenom = mvarPrenom
End Property

' Date de naissance du membre
'------------------------------------------------------------------------------
Public Property Let Naissance(ByVal vData As Date)
    mvarNaissance = vData
End Property
Public Property Get Naissance() As Date
    Naissance = mvarNaissance
End Property

' Liste des rôles du membre
'------------------------------------------------------------------------------
Public Property Set Roles(ByVal vData As CRoles)
    Set mvarRoles = Nothing
    Set mvarRoles = vData
End Property
Public Property Get Roles() As CRoles
    Set Roles = mvarRoles
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    mvarId = 0
    mvarPrenom = "NO DATA"
    mvarNaissance = CDate("01.01.1900")
    Set mvarRoles = New CRoles
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
    Set mvarRoles = Nothing
End Sub

VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CMinistere"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"No"
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private mvarNom As String           'local copy
Private mvarDescription As String   'local copy
Private mvarId As Integer           'local copy

' Identifiant du ministère
'------------------------------------------------------------------------------
Public Property Let id(ByVal vData As Integer)
    mvarId = vData
End Property
Public Property Get id() As Integer
    id = mvarId
End Property

' Nom du ministère
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal vData As String)
    mvarNom = vData
End Property
Public Property Get Nom() As String
    Nom = mvarNom
End Property

' Description du ministère
'------------------------------------------------------------------------------
Public Property Let Description(ByVal vData As String)
    mvarDescription = vData
End Property
Public Property Get Description() As String
    Description = mvarDescription
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    mvarId = 0
    mvarNom = "NO DATA"
    mvarDescription = "NO DATA"
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

End Sub

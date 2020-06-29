VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CRole"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private mvarMinistere As CMinistere 'local copy
Private mvarDebut As Date 'local copy

' Ministère du rôle
'------------------------------------------------------------------------------
Public Property Set Ministere(ByVal vData As CMinistere)
    Set mvarMinistere = Nothing
    Set mvarMinistere = vData
End Property
Public Property Get Ministere() As CMinistere
    Set Ministere = mvarMinistere
End Property

' Début du rôle dans le ministère
'------------------------------------------------------------------------------
Public Property Let Debut(ByVal vData As Date)
    mvarDebut = vData
End Property
Public Property Get Debut() As Date
    Debut = mvarDebut
End Property



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    mvarDebut = 0
    Set mvarMinistere = New CMinistere
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
    Set mvarMinistere = Nothing
End Sub

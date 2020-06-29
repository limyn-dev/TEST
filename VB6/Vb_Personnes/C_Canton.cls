VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Canton"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Membres
Private mId As Long
Private mNom As String

'------------------------------------------------------------------------------
'   Construction destruction de l'instance
'==============================================================================
Private Sub Class_Initialize()

    ' Instanciation des membres
    
    ' Initialisation des membres
    
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

    ' Désinstanciation des membres
    
End Sub



'******************************************************************************

'------------------------------------------------------------------------------
'   Proprieté Id
'==============================================================================
Public Property Get Id() As Long
    Id = mId
End Property
'------------------------------------------------------------------------------
Public Property Let Id(ByVal val As Long)
    mId = val
End Property

'------------------------------------------------------------------------------
'   Proprieté Nom
'==============================================================================
Public Property Get Nom() As String
    Nom = mNom
End Property
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal val As String)
    mNom = val
End Property






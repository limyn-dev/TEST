VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Localite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Membres
Private mId As Long
Private mNom As String
Private mNpa As String
Private mCtn As C_Canton

'------------------------------------------------------------------------------
'  Instanciation, désinstanciation de la classe
'==============================================================================
Private Sub Class_Initialize()
   
   ' Instanciation des membres
   Set mCtn = New C_Canton
   
   ' Initialisation des mmbres
   mNom = "Indefinis"
   mNpa = "Indefinis"
   
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

   ' Désinstanciation des membres
   Set mCtn = Nothing
   
End Sub



'******************************************************************************

'------------------------------------------------------------------------------
'  Propriété Id
'==============================================================================
Public Property Get id() As Long
   id = mId
End Property
'------------------------------------------------------------------------------
Public Property Let id(ByVal val As Long)
   mId = val
End Property

'------------------------------------------------------------------------------
'  Propriété Nom
'============================================================================
Public Property Get Nom() As String
   Nom = mNom
End Property
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal val As String)
   mNom = val
End Property

'------------------------------------------------------------------------------
'  Propriété Npa
'==============================================================================
Public Property Get Npa() As String
   Npa = mNpa
End Property
'------------------------------------------------------------------------------
Public Property Let Npa(ByVal val As String)
   mNpa = val
End Property

'------------------------------------------------------------------------------
'  Propriété Canton
'==============================================================================
Public Property Get Canton() As C_Canton
   Set Canton = New C_Canton
   Set Canton = mCtn
End Property
'------------------------------------------------------------------------------
Public Property Set Canton(ByVal obj As C_Canton)
   Set mCtn = obj
End Property

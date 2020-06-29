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
'  Instanciation, d�sinstanciation de la classe
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

   ' D�sinstanciation des membres
   Set mCtn = Nothing
   
End Sub



'******************************************************************************

'------------------------------------------------------------------------------
'  Propri�t� Id
'==============================================================================
Public Property Get id() As Long
   id = mId
End Property
'------------------------------------------------------------------------------
Public Property Let id(ByVal val As Long)
   mId = val
End Property

'------------------------------------------------------------------------------
'  Propri�t� Nom
'============================================================================
Public Property Get Nom() As String
   Nom = mNom
End Property
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal val As String)
   mNom = val
End Property

'------------------------------------------------------------------------------
'  Propri�t� Npa
'==============================================================================
Public Property Get Npa() As String
   Npa = mNpa
End Property
'------------------------------------------------------------------------------
Public Property Let Npa(ByVal val As String)
   mNpa = val
End Property

'------------------------------------------------------------------------------
'  Propri�t� Canton
'==============================================================================
Public Property Get Canton() As C_Canton
   Set Canton = New C_Canton
   Set Canton = mCtn
End Property
'------------------------------------------------------------------------------
Public Property Set Canton(ByVal obj As C_Canton)
   Set mCtn = obj
End Property
VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Personne"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

' Structure des données d'une personne
Type T_Prs
   Id As Long
   Nom As String
   Prn As String
   Adr As String
   Loc As C_Localite
End Type

' Membres
Private mPrs As T_Prs

'------------------------------------------------------------------------------
'   Construction destruction de l'instance
'==============================================================================
Private Sub Class_Initialize()

    ' Instanciation et initialisation des membres
    With mPrs
      Let .Nom = "Indéfinis"
      Let .Prn = "Indéfinis"
      Let .Adr = "Indéfinis"
      Set .Loc = New C_Localite
    End With
    
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()

   ' Déinstanciation des membres
   With mPrs
      Set .Loc = Nothing
   End With
    
End Sub



'******************************************************************************

'------------------------------------------------------------------------------
'   Proprieté Id
'==============================================================================
Public Property Get Id() As Long
    Id = mPrs.Id
End Property
'------------------------------------------------------------------------------
Public Property Let Id(ByVal val As Long)
    mPrs.Id = val
End Property

'------------------------------------------------------------------------------
'   Proprieté Nom
'==============================================================================
Public Property Get Nom() As String
    Nom = mNom
End Property
'------------------------------------------------------------------------------
Public Property Let Nom(ByVal vNewValue As String)
    mNom = vNewValue
End Property

'------------------------------------------------------------------------------
'   Proprieté Prenom
'==============================================================================
Public Property Get Prenom() As String
    Prenom = mPrn
End Property
'------------------------------------------------------------------------------
Public Property Let Prenom(ByVal vNewValue As String)
    mPrn = vNewValue
End Property

'------------------------------------------------------------------------------
'   Proprieté Canton
'==============================================================================
Public Property Get Localite() As C_Localite
    Set Localite = mLoc
End Property
'------------------------------------------------------------------------------
Public Property Set Localite(ByVal vNewValue As C_Localite)
    mLoc = vNewValue
End Property




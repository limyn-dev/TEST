VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_NpasLocs"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
'   Structure de la table des associations NPA localité
'==============================================================================
Private Const FLDNPAID = "_NpaId"   ' Champs de l'id des NPA
Private Const FLDLOCID = "_LocId"   ' Champs de l'id des localités

'------------------------------------------------------------------------------
'   Construction destruction de l'instance
'==============================================================================
Private Sub Class_Initialize()
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub

'------------------------------------------------------------------------------
'  Recherche des localités en fonction de l'id du NPA
'==============================================================================
Private Function fndNpa(locId As Long) As Variant
   Dim lstId() As Long

   dtaEnv.locsNpa locId
   
   
End Function

'------------------------------------------------------------------------------
'  Recherche des ids des NPA en fonction de l'id de la localité
'==============================================================================
Private Sub fndLoc(npaId As Long)

   With M_DbPrs.dtaEnv.tblNpa
      
      If .EOF Then .MoveFirst
      
      ' Recherche du type dans la table
      If Not (.Fields(FLDID).Value = npaId) Then
         If Not .BOF Then .MoveFirst
         .Find FLDID & "=" & CStr(npaId)
      End If
      
   End With
   
End Sub



'******************************************************************************

'------------------------------------------------------------------------------
'   Nombre de NPA dans la table
'==============================================================================
Public Property Get Nombre() As Long

   ' Valorisation de la propriété
   Nombre = M_DbPrs.dtaEnv.tblNpa.Fields.Count
   
End Property
'------------------------------------------------------------------------------
'Public Property Let Nombre(ByVal vNewValue As Variant)
'End Property

'------------------------------------------------------------------------------
'   Proprieté Val
'==============================================================================
Public Property Get Val(npaId As Long) As String
   
   ' Positionnemnt sur la table
   fndNpa (npaId)
   
   ' Valorisation de la propriété
   With M_DbPrs.dtaEnv.tblNpa
      If .Fields(FLDID).Value = npaId Then
         Val = .Fields(FLDVAL).Value
      Else
         Val = "Id hors table"
      End If
   End With
   
End Property
'------------------------------------------------------------------------------
Public Property Let Val(npaId As Long, ByVal str As String)

   ' Positionnemnt sur la table
   fndNpa (npaId)
   
   ' Modification de la db
   With M_DbPrs.dtaEnv.tblNpa
      If .Fields(FLDID).Value = npaId Then .Fields(FLDVAL).Value = str
   End With
   
End Property

'------------------------------------------------------------------------------
'  Ajout d'un NPA dans la table
'==============================================================================
Public Sub Ajouter(npaVal As String)

   With M_DbPrs.dtaEnv.tblNpa
      .AddNew
      .Fields(FLDID).Value = .Fields.Count + 1
      .Fields(FLDVAL).Value = npaVal
      .Update
   End With
   
End Sub

'------------------------------------------------------------------------------
'  Suppression d'un NPA dans la table
'=============================================================================
Public Sub Supprimer(npaId As Long)

   ' Positionnement su la table
   fndCtn npaId
   
   ' Suppression du canton
   With M_DbPrs.dtaEnv.tblNpa
      If .Fields(FLDID).Value = npaId Then .Delete
      .Update
   End With
   
End Sub



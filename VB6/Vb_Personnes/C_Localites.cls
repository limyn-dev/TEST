VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Localites"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
'   Structure de la table des cantons
'==============================================================================
Private Const FLDID = "LocId"      ' Champs de l'id de la localité
Private Const FLDNOM = "LocNom"    ' Champs de l'nom de la localité
Private Const FLD_CTNID = "_CtnId" ' Champs de l'id du canton

'------------------------------------------------------------------------------
'   Construction destruction de l'instance
'==============================================================================
Private Sub Class_Initialize()
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub

'------------------------------------------------------------------------------
'  Recherche d'une localite dans la table
'==============================================================================
Private Sub fndLoc(idLoc As Long)

   With M_DbPrs.dtaEnv.tblLoc
      
      If .EOF Then .MoveFirst
      
      ' Recherche du type dans la table
      If Not (.Fields(FLDID).Value = idLoc) Then
         If Not .BOF Then .MoveFirst
         .Find FLDID & "=" & CStr(idLoc)
      End If
      
   End With
   
End Sub



'******************************************************************************

'------------------------------------------------------------------------------
'   Nombre de localité dans la table
'==============================================================================
Public Property Get Nombre() As Long

   ' Valorisation de la propriété
   Nombre = M_DbPrs.dtaEnv.tblLoc.Fields.Count
   
End Property
'------------------------------------------------------------------------------
'Public Property Let Nombre(ByVal vNewValue As Variant)
'End Property

'------------------------------------------------------------------------------
'   Proprieté Nom
'==============================================================================
Public Property Get Nom(locId As Long) As String
   
   ' Positionnemnt sur la table
   fndCtn (locId)
   
   ' Valorisation de la propriété
   With M_DbPrs.dtaEnv.tblLoc
      If .Fields(FLDID).Value = locId Then
         Nom = .Fields(FLDNOM).Value
      Else
         Nom = "Id hors table"
      End If
   End With
   
End Property
'------------------------------------------------------------------------------
Public Property Let Nom(locId As Long, ByVal str As String)

   ' Positionnemnt sur la table
   fndCtn (locId)
   
   ' Modification de la db
   With M_DbPrs.dtaEnv.tblLoc
      If .Fields(FLDID).Value = locId Then .Fields(FLDNOM).Value = str
   End With
   
End Property

'------------------------------------------------------------------------------
'   Proprieté Canton (initiales)
'==============================================================================
Public Property Get ctnId(locId As Long) As Long
   
   ' Positionnemnt sur la table
   fndCtn (locId)
   
   ' Valorisation de la propriété
   With M_DbPrs.dtaEnv.tblLoc
      If .Fields(FLDID).Value = locId Then
         ctnId = .Fields(FLD_CTNID).Value
      Else
         ctnId = "Id hors table"
      End If
   End With
   
End Property
'------------------------------------------------------------------------------
Public Property Let ctnId(locId As Long, ByVal Val As Long)

   ' Positionnemnt sur la table
   fndCtn (locId)
   
   ' Modification de la db
   With M_DbPrs.dtaEnv.tblLoc
      If .Fields(FLDID).Value = locId Then .Fields(FLD_CTNID).Value = Val
   End With
   
End Property

'------------------------------------------------------------------------------
'  Ajout d'un type dans la table
'==============================================================================
Public Sub Ajouter(locNom As String, ctnId As Long)

   With M_DbPrs.tblCtn
      .AddNew
      .Fields(FLDID).Value = .Fields.Count + 1
      .Fields(FLDNOM).Value = locNom
      .Fields(FLD_CTNID).Value = ctnId
      .Update
   End With
   
End Sub

'------------------------------------------------------------------------------
'  Suppression d'un type dans la table
'=============================================================================
Public Sub Supprimer(locId As Long)

   ' Positionnement su la table
   fndCtn locId
   
   ' Suppression du canton
   With M_DbPrs.dtaEnv.tblLoc
      If .Fields(FLDID).Value = locId Then .Delete
      .Update
   End With
   
End Sub



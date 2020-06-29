VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Cantons"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

'------------------------------------------------------------------------------
'   Structure de la table des cantons
'==============================================================================
Private Const FLDID = "CtnId"   ' Champs de l'id du canton
Private Const FLDNOM = "CtnNom" ' Champs de l'nom du canton
Private Const FLDINL = "CtnInl" ' Champs des initiales du canton

'------------------------------------------------------------------------------
'   Construction destruction de l'instance
'==============================================================================
Private Sub Class_Initialize()
End Sub
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
End Sub

'------------------------------------------------------------------------------
'  Recherche d'un type dans la table
'==============================================================================
Private Sub fndCtn(id As Long)

   With M_DbPrs.dtaEnv.tblCtn
      
      If .EOF Then .MoveFirst
      
      ' Recherche du type dans la table
      If Not (.Fields(FLDID).Value = id) Then
         If Not .BOF Then .MoveFirst
         .Find FLDID & "=" & CStr(id)
      End If
      
   End With
   
End Sub



'******************************************************************************

'------------------------------------------------------------------------------
'   Nombre de canton dans la table
'==============================================================================
Public Property Get Nombre() As Long

   ' Valorisation de la propriété
   Nombre = M_DbPrs.dtaEnv.tblCtn.Fields.Count
   
End Property
'------------------------------------------------------------------------------
'Public Property Let Nombre(ByVal vNewValue As Variant)
'End Property

'------------------------------------------------------------------------------
'   Proprieté Nom
'==============================================================================
Public Property Get Nom(ctnId As Long) As String
   
   ' Positionnemnt sur la table
   fndCtn (ctnId)
   
   ' Valorisation de la propriété
   With M_DbPrs.dtaEnv.tblCtn
      If .Fields(FLDID).Value = ctnId Then
         Nom = .Fields(FLDNOM).Value
      Else
         Nom = "Id hors table"
      End If
   End With
   
End Property
'------------------------------------------------------------------------------
Public Property Let Nom(ctnId As Long, ByVal str As String)

   ' Positionnemnt sur la table
   fndCtn (ctnId)
   
   ' Modification de la db
   With M_DbPrs.dtaEnv.tblCtn
      If .Fields(FLDID).Value = ctnId Then .Fields(FLDNOM).Value = str
   End With
   
End Property

'------------------------------------------------------------------------------
'   Proprieté Inl (initiales)
'==============================================================================
Public Property Get Inl(ctnId As Long) As String
   
   ' Positionnemnt sur la table
   fndCtn (ctnId)
   
   ' Valorisation de la propriété
   With M_DbPrs.dtaEnv.tblCtn
      If .Fields(FLDID).Value = ctnId Then
         Inl = .Fields(FLDINL).Value
      Else
         Inl = "Id hors table"
      End If
   End With
   
End Property
'------------------------------------------------------------------------------
Public Property Let Inl(ctnId As Long, ByVal str As String)

   ' Positionnemnt sur la table
   fndCtn (ctnId)
   
   ' Modification de la db
   With M_DbPrs.dtaEnv.tblCtn
      If .Fields(FLDID).Value = ctnId Then .Fields(FLDINL).Value = str
   End With
   
End Property

'------------------------------------------------------------------------------
'  Ajout d'un type dans la table
'==============================================================================
Public Sub Ajouter(ctnNom As String, Optional ctnInl As String = "")

   With M_DbPrs.dtaEnv.tblCtn
      .AddNew
      .Fields(FLDID).Value = .Fields.Count + 1
      .Fields(FLDNOM).Value = Nom
      .Fields(FLDINL).Value = Inl
      .Update
   End With
   
End Sub

'------------------------------------------------------------------------------
'  Suppression d'un type dans la table
'=============================================================================
Public Sub Supprimer(idCtn As Long)

   ' Positionnement su la table
   fndCtn idCtn
   
   ' Suppression du canton
   With M_DbPrs.dtaEnv.tblCtn
      If .Fields(FLDID).Value = idCtn Then .Delete
      .Update
   End With
   
End Sub


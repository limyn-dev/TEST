VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_LstTpe"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ TYPES MEMBRES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Structure de donnée d'une liste de type
'==============================================================================
Private Type T_LstTpe
   TpesId() As Long  ' Liste des Id des types
   LstOk As Boolean  ' Flag de validité des données de la liste
End Type



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ DONNEES MEMBRES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

Private mLstTpe As T_LstTpe



'§§§§§§§§§§§§§§§§§§§§§§§§§ PROPRIETES ET METHODES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Nombre de types dans la liste
'==============================================================================
Property Get NbrTpe() As Integer

   With mLstTpe
   
      ' Contrôle de la validité des données
      If Not .LstOk Then setLstTpe
   
      ' Valorisation de la propriété
      NbrTpe = UBound(.TpesId)
      
   End With
   
End Property

'------------------------------------------------------------------------------
' Un des types de la liste
'==============================================================================
Property Get numTpe(num As Integer) As C_Type
   Dim tpe As New C_Type
   
   With mLstTpe
   
      ' Contrôle de la validité des données
      If Not .LstOk Then setLstTpe
   
      ' Initialisation du type
      tpe.tpeId = .TpesId(num)
   
      ' Valorisation de la propriété
      Set numTpe = tpe
   
   End With
   
   ' Désallocation
   Set tpe = Nothing
   
End Property



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Création de la liste des types
'==============================================================================
Private Sub setLstTpe()
   Dim numTpe As Integer
   
   With mLstTpe
   
      ' Initialisation de la liste des cpo
      ReDim .TpesId(0)
   
      ' Initialisation de l'index de la table des types
      ModDtb.tblTpe.MoveFirst
      
      ' Parcourt de la table des types
      While Not ModDtb.tblTpe.EOF
         
         ' Ajout de l'Id dans la liste
         numTpe = numTpe + 1
         ReDim Preserve .TpesId(numTpe)
         .TpesId(numTpe) = ModDtb.tblTpe.Fields("TpeId_").Value
      
         ' Composant suivant
         ModDtb.tblTpe.MoveNext
      
      Wend
      
      ' Mise à jour du flag
      .LstOk = True
   
   End With
   
End Sub


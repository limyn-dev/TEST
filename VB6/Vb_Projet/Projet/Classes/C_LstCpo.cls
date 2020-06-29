VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_LstCpo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ TYPES MEMBRES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Structure de donnée d'une liste de composant
'==============================================================================
Private Type T_LstCpo
   tpeId As Long        ' Id du type des composant de la liste
   CposId() As Long     ' Liste des Id des composant
   LstCpoOk As Boolean  ' Flag de validité des données de la liste
End Type



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ DONNEES MEMBRES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

Private mLstCpo As T_LstCpo



'§§§§§§§§§§§§§§§§§§§§§§§§§ PROPRIETES ET METHODES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Type des composant de la liste
'==============================================================================
Property Get tpeId() As Long

   LstTpeId = mLstCpo.tpeId
   
End Property
Property Let tpeId(tpeId As Long)

   ' Saisie du type des composants de la liste
   mLstCpo.tpeId = tpeId
   
End Property

'------------------------------------------------------------------------------
' Nombre de composant dans la liste
'==============================================================================
Property Get CpoNbr() As Integer

   ' Contrôle de la validité des données
   If Not mLstCpo.LstCpoOk Then setLstCpo mLstCpo
   
   ' Valorisation de la propriété
   CpoNbr = UBound(mLstCpo.CposId)
   
End Property

'------------------------------------------------------------------------------
' Id d'un des composant de la liste
'==============================================================================
Property Get CpoId(numCpo As Integer) As Long

   ' Contrôle de la validité des données
   If Not mLstCpo.LstCpoOk Then setLstCpo mLstCpo
   
   ' Valorisation de la propriété
   CpoId = mLstCpo.CposId(numCpo)
   
End Property

'------------------------------------------------------------------------------
' Un des composant de la liste
'==============================================================================
Property Get CpoCpo(numCpo As Integer) As C_Composant
   Dim cpo As New C_Composant
   
   ' Contrôle de la validité des données
   If Not mLstCpo.LstCpoOk Then setLstCpo mLstCpo
   
   ' Valorisation du composant
   cpo.CpoId = mLstCpo.CposId(numCpo)
   
   ' Valorisation de la propriété
   CpoCpo = cpo
   
   ' Désallocation
   Set cpo = Nothing
   
End Property



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ OUTILS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Initalisation de la liste des composant en fonction du type
'==============================================================================
Private Sub setLstCpo(lstCpo As T_LstCpo)
   Dim Cpos As ADODB.Recordset
   Dim numCpo As Integer
   
   ' Initialisation de la liste des cpo
   ReDim lstCpo.CposId(0)
   
   ' Recherche des entités du type
   Set Cpos = ModDtb.PrcRun("QryTpe", lstCpo.tpeId)
   
   ' Insértion des Id des Composants
   While Not Cpos.EOF
         
      ' Ajout de l'Id dans la liste
      numCpo = numCpo + 1
      ReDim Preserve lstCpo.CposId(numCpo)
      lstCpo.CposId(numCpo) = Cpos.Fields("Id").Value
      
      ' Composant suivant
      Cpos.MoveNext
      
   Wend
   
   ' Mise à jour du flag
   lstCpo.LstCpoOk = True
   
   ' Désallocation
   Cpos.Close
   Set Cpos = Nothing
   
End Sub

VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "C_Entite"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Types membres §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Structure de donnée d'une entité
'==============================================================================
Private Type T_Ent
   
   entId As Long              ' Id du composant principal
   LstCprs() As C_Composant   ' Liste des composants de référance de l'entité
   LstAtrs() As Integer       ' Liste des attributs des composants par nivaux
   nbrAtr As Integer          ' Nombre d'attributs
   EntOk As Boolean           ' Flag d'initialisation de l'entité
   
End Type



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ DONNEES MEMBRES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Entité
'==============================================================================
Dim mEnt As T_Ent



'§§§§§§§§§§§§§§§§§§§§§§§§§§§ PROPRIETE ET METHODE §§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Définis l'Id du composant principal et initialise l'entité
'==============================================================================
Property Get entId() As Long

   If mEnt.EntOk Then
      
      ' Valorisation de la propriété
      entId = mEnt.LstCprs(0).CpoId
      
   Else
   
      ' Si la propriete n'est pas initialisée
      entId = 0
      
   End If
      
End Property
Property Let entId(id As Long)
   
   If id > 0 Then
   
      ' Initialisation de l'entité avec les valeurs des composants
      mEnt.entId = id
      setEnt mEnt
      
   Else
   
      ' Reset de l'entité
      delEnt mEnt
   
   End If
      
End Property



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ ATTRIBUTS §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Nombre d'attributs
'==============================================================================
Property Get AtrNbr() As Integer

   AtrNbr = mEnt.nbrAtr

End Property

'------------------------------------------------------------------------------
' Nom d'un attributs
'==============================================================================
Property Get AtrNom(numAtr As Integer) As String
   
   AtrNom = mEnt.LstCprs(mEnt.LstAtrs(0, numAtr)).AtrNom(mEnt.LstAtrs(1, numAtr))

End Property

'------------------------------------------------------------------------------
' Valeur d'un attributs
'==============================================================================
Property Get AtrVal(numAtr As Integer) As String
   
   AtrVal = mEnt.LstCprs(mEnt.LstAtrs(0, numAtr)).AtrVal(mEnt.LstAtrs(1, numAtr))

End Property
Property Let AtrVal(numAtr As Integer, valeur As String)
   
   ' Mise à jour du composant et de la table de déscription du composant
   mEnt.LstCprs(mEnt.LstAtrs(0, numAtr)).AtrVal(mEnt.LstAtrs(1, numAtr)) = valeur

End Property



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Methodes §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Affiche les attributs de l'entité dans un jeux de testbox et labels
'==============================================================================
Public Sub atrAffiche(ByRef lbl As Variant, ByRef txt As Variant)
   Dim atr As Integer
      
   ' Initialisation des lables et txtbox
   ModLbl.AtrIni lbl, txt, mEnt.nbrAtr
   
   ' Parcourt des attributs
   For atr = 1 To mEnt.nbrAtr
            
      ' Insértion des noms et des valeurs des attributs de chaque composant de l'entité
      lbl(atr).Caption = mEnt.LstCprs(mEnt.LstAtrs(0, atr)).AtrNom(mEnt.LstAtrs(1, atr)) & "  :     "
      txt(atr).Text = mEnt.LstCprs(mEnt.LstAtrs(0, atr)).AtrVal(mEnt.LstAtrs(1, atr))
            
   Next atr
   
End Sub

Public Sub EntVide()

   ' Désalocation des composants de l'entité
   delEnt mEnt
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ Outils §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Création de la table des attribut en indéxant chaque attribut de tous les
' composants de l'entité par ordre de niveau (lvl)
'==============================================================================
Private Sub setAtr(ByRef ent As T_Ent)
   Dim lvl As Long
   Dim cpo As Integer
   Dim atrCpo As Integer
   Dim atrEnt As Integer
   
   ' Initialisation de la liste des attributs (groupement des attributs des composants)
   ReDim ent.LstAtrs(1, 0)
   ent.nbrAtr = 0
   
   ' Recherche du niveau maximum des composants
   For cpo = 0 To UBound(ent.LstCprs)
      If ent.LstCprs(cpo).TpeLvl > lvl Then
         lvl = ent.LstCprs(cpo).TpeLvl
      End If
   Next cpo
   
   ' Parcourt des niveaux
   While lvl > 0
      
      ' Parcourt de liste des composants
      For cpo = 0 To UBound(ent.LstCprs)
         
         ' Contrôle du niveau
         If ent.LstCprs(cpo).TpeLvl = lvl Then
                  
            ' Indéxation des attribut du composant
            For atrCpo = 1 To ent.LstCprs(cpo).AtrNbr
            
               ' Redimentionnement de la liste des index des attributs
               atrEnt = atrEnt + 1
               ReDim Preserve ent.LstAtrs(1, atrEnt)
               
               ' Ajout de l'index du composant et de l'index de l'attribut
               ent.LstAtrs(0, atrEnt) = cpo
               ent.LstAtrs(1, atrEnt) = atrCpo
               ent.nbrAtr = ent.nbrAtr + 1
               
            Next atrCpo
            
         End If
         
      Next cpo
      
      lvl = lvl - 1
      
   Wend

End Sub

'------------------------------------------------------------------------------
' Ajout des composant de référance du coposant principal
'==============================================================================
Private Sub setRef(ByRef ent As T_Ent)
   Dim numCpo As Integer
   Dim lstIdRef() As Long
   Dim numLNKCPR As Integer
   
   ' Recherche du dérnier composant de la liste
   numCpo = UBound(ent.LstCprs)
   
   ' Création de la liste des id des composants de référance
   ReDim lstIdRef(0)
   For numLNKCPR = 1 To ent.LstCprs(numCpo).CprNbr
      ReDim Preserve lstIdRef(numLNKCPR)
      lstIdRef(numLNKCPR) = ent.LstCprs(numCpo).cprId(numLNKCPR)
   Next numLNKCPR
   
   ' Insértion des composants de référance dans la liste
   While numLNKCPR > 1
   
      numCpo = numCpo + 1
      ReDim Preserve ent.LstCprs(numCpo)
      Set ent.LstCprs(numCpo) = New C_Composant
      ent.LstCprs(numCpo).CpoId = lstIdRef(numLNKCPR - 1)
      
      ' Ajout des composants de référance du composant de référance
      setRef ent
      
      ' Composant de référance suivant
      numLNKCPR = numLNKCPR - 1
   
   Wend
   
End Sub

'------------------------------------------------------------------------------
' Initialise l'entité à partir de l'id du composant de base
'==============================================================================
Private Sub setEnt(ent As T_Ent)

   ' Initialisation de l'entite
   delEnt ent
   
   If ent.entId > 0 Then
   
      ' Initialisation de la liste des composants avec le composant principal de l'entité
      Set ent.LstCprs(0) = New C_Composant
      ent.LstCprs(0).CpoId = ent.entId
   
      ' Création de la liste des composants de référance
      setRef ent
   
      ' Création de la liste des attributs
      setAtr ent
   
      ' Mise à jour du flag
      ent.EntOk = True
      
   End If
 
End Sub

'------------------------------------------------------------------------------
' Désallocation des données membres
'==============================================================================
Private Sub delEnt(ent As T_Ent)
   Dim numCpo As Integer
   
   If ent.EntOk Then
   
      ' Désallocation des composants
      For numCpo = 0 To UBound(ent.LstCprs)
         Set ent.LstCprs(numCpo) = Nothing
      Next numCpo
   
   End If
   
   ' reset de laliste des composants
   ReDim ent.LstCprs(0)
   
   ' reset de la liste des attributs
   ReDim ent.LstAtrs(0)
   
   ' reset du nombre d'attributs
   ent.nbrAtr = 0
   
   ' Mise à jour du flag
   ent.EntOk = False
   
End Sub



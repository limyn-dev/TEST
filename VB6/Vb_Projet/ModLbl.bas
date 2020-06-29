Attribute VB_Name = "ModLbl"
Option Explicit

' Position des labels et textBox pour les attributs
Const ATR_SZELBL = 300
Const ATR_MRGHAU = 0

' Position des boutons option pour les types supports
Const TPESUP_SZEOPT = 300
Const TPESUP_MRGHAU = 0

'------------------------------------------------------------------------------
' Affichage des attributs d'une entité dans un jeux de labels et textbox
'==============================================================================
Public Sub AfficheEnt(ByRef ent As C_Entite, ByRef lbl As Variant, ByRef txt As Variant)
   Dim numLvl As Integer
   Dim numCpo As Integer
   
   ' Initialisation des labels et textbox
   ModLbl.AtrIni lbl, txt
   
   ' Affichage de l'entite par niveau des composants
   For numLvl = ent.LvlMax To 1 Step -1
   
      ' Parcourt des composant
      For numCpo = 0 To ent.CpoRefNbr
      
         ' Contrôle du niveau du composant
         If ent.CpoRef(numCpo).Niveau = numLvl Then
         
            ' Affichage des attributs du composant
            ent.CpoRef(numCpo).Affiche lbl, txt
            
         End If

      Next numCpo
      
   Next numLvl
End Sub

'------------------------------------------------------------------------------
' Affichage des boutons options pour la séléction des types supports
'==============================================================================
Public Sub AfficheTpeSup(ent As C_Entite, opt As Variant)
   Dim nbrOpt As Integer
   
   ' Initialisation des opt
   TpeSupIni opt
   
   ' Création des opt
   nbrOpt = ent.TpeSupNbr
   TpeSupAdd opt, nbrOpt
   
   ' Affectation des caption
   While nbrOpt > 0
   
      opt.Item(nbrOpt).Caption = ent.TpeSupNom(nbrOpt)
      nbrOpt = nbrOpt - 1
      
   Wend
   
End Sub

'------------------------------------------------------------------------------
' Ajout de labels et textBox
'==============================================================================
Public Function AtrAdd(lbl As Variant, txt As Variant, Nbr As Integer) As Integer
   Dim i As Integer
   
   i = lbl.Count
   
   While Nbr > 0
    
      ' Ajout des labels
      Load lbl(i)
      With lbl(i)
         .Visible = True
         .ZOrder (0)
         .Top = i * ATR_SZELBL + ATR_MRGHAU
      End With
      
      ' Ajout des textBox
      Load txt(i)
      With txt(i)
         .Visible = True
         .ZOrder (0)
         .Top = i * ATR_SZELBL + ATR_MRGHAU
      End With
     
      Nbr = Nbr - 1
      i = i + 1
      
   Wend
   
   AtrAdd = i - 1
   
End Function

'------------------------------------------------------------------------------
' Suppression des labels et textBox
'==============================================================================
Public Function AtrDel(lbl As Variant, txt As Variant, Nbr As Integer) As Integer
   Dim i As Integer
   
   ' Recherche du bombre de label
   i = lbl.Count - 1

   ' Contrôle du nombre à supprimer
   If Nbr > i Then Nbr = i
   
   ' Suppression des labels et des textbox
   While Nbr > 0
      Unload (lbl.Item(i))
      Unload (txt.Item(i))
      Nbr = Nbr - 1
      i = i - 1
   Wend
   
   AtrDel = i
   
End Function

'------------------------------------------------------------------------------
' Reset des label et textbox
'==============================================================================
Public Sub AtrIni(lbl As Variant, txt As Variant)
   Dim i As Integer
   
   i = lbl.Count - 1
   
   If i > 0 Then
      
      ' Suppression de tous les labels chargés
      AtrDel lbl, txt, i
      
   End If
   
End Sub

'------------------------------------------------------------------------------
' Ajout des option boutons pour la séléction des types supports
'==============================================================================
Public Sub TpeSupAdd(opt As Variant, Nbr As Integer)
   Dim i As Integer
   
   While Nbr > 0
    
      ' Ajout des labels
      i = i + 1
      Load opt(i)
      With opt(i)
         .Visible = True
         .ZOrder (0)
         .Top = i * TPESUP_SZEOPT + TPESUP_MRGHAU
      End With
      
      Nbr = Nbr - 1
      
   Wend
   
End Sub

'------------------------------------------------------------------------------
' Reset des options boutons de séléction des types supports
'==============================================================================
Public Sub TpeSupIni(opt As Variant)
   Dim i As Integer
   
   i = opt.Count - 1
   
   While i > 0
      
      ' Suppression de tous les labels chargés
      Unload (opt.Item(i))
      i = i - 1
      
   Wend
   
End Sub






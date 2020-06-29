Attribute VB_Name = "ModOpt"
Option Explicit

' Position des boutons option pour les types supports
Const TPESUP_SZEOPT = 300
Const TPESUP_MRGHAU = 0


'------------------------------------------------------------------------------
' Affichage des boutons options pour la séléction des types supports
'==============================================================================
Public Sub AfficheTpeSup(ent As C_Entite, opt As Variant)
   Dim nbrOpt As Integer
   
   ' Initialisation des opt
   TpeSupIni opt
   
   ' Création des opt
   nbrOpt = ent.TpsNbr
   TpeSupAdd opt, nbrOpt
   
   ' Affectation des caption
   While nbrOpt > 0
   
      opt.Item(nbrOpt).Caption = ent.TpsNom(nbrOpt)
      nbrOpt = nbrOpt - 1
      
   Wend
   
End Sub

'------------------------------------------------------------------------------
' Ajout des boutons options pour la séléction des types supports
'==============================================================================
Public Sub TpeSupAdd(ByRef opt As Variant, ByVal nbr As Integer)
   Dim i As Integer
   
   While nbr > 0
    
      ' Ajout des labels
      i = i + 1
      Load opt(i)
      With opt(i)
         .Visible = True
         .ZOrder (0)
         .Top = i * TPESUP_SZEOPT + TPESUP_MRGHAU
      End With
      
      nbr = nbr - 1
      
   Wend
   
End Sub

'------------------------------------------------------------------------------
' Initialisation des boutons options de séléction des types supports
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

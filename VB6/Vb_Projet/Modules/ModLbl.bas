Attribute VB_Name = "ModLbl"
Option Explicit

' Position des labels et textBox pour les attributs
Const ATR_SZELBL = 300
Const ATR_MRGHAU = 250

'------------------------------------------------------------------------------
' Initialisation des labels et textbox
'==============================================================================
Public Sub AtrIni(lbl As Variant, txt As Variant, nbr As Integer)
   Dim i As Integer
   
   i = lbl.Count - 1
   
   If i < nbr Then
   
      ' Ajout des lables et textbox manquant
      atrAdd lbl, txt, nbr - i
      
   Else
   
      ' Suppression de tous les labels et textbox superflus
      If i > nbr Then AtrDel lbl, txt, i - nbr
      
   End If
   
End Sub

'------------------------------------------------------------------------------
' Ajout de labels et textBox
'==============================================================================
Public Function atrAdd(lbl As Variant, txt As Variant, nbr As Integer) As Integer
   Dim i As Integer
   
   i = lbl.Count
   
   While nbr > 0
    
      ' Ajout des labels
      Load lbl(i)
      With lbl(i)
         .Visible = True
         .ZOrder (0)
         .Top = (i - 1) * ATR_SZELBL + ATR_MRGHAU
      End With
      
      ' Ajout des textBox
      Load txt(i)
      With txt(i)
         .Visible = True
         .ZOrder (0)
         .Top = (i - 1) * ATR_SZELBL + ATR_MRGHAU
      End With
     
      nbr = nbr - 1
      i = i + 1
     
   Wend
   
   atrAdd = i - 1
   
End Function

'------------------------------------------------------------------------------
' Suppression des labels et textBox
'==============================================================================
Public Function AtrDel(lbl As Variant, txt As Variant, nbr As Integer) As Integer
   Dim i As Integer
   
   ' Recherche du bombre de label
   i = lbl.Count - 1

   ' Contrôle du nombre à supprimer
   If nbr > i Then nbr = i
   
   ' Suppression des labels et des textbox
   While nbr > 0
      Unload (lbl.Item(i))
      Unload (txt.Item(i))
      nbr = nbr - 1
      i = i - 1
   Wend
   
   AtrDel = i
   
End Function




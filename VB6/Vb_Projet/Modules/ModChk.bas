Attribute VB_Name = "ModChk"
Option Explicit

' Position des ChkBox
Const SZECHK = 300
Const MRGHAU = 0

'------------------------------------------------------------------------------
' Affichage et sélection du nom du type pour une checkbox
'==============================================================================
Public Sub setChk(ByRef chk As Variant, numChk As Integer, nomChk As String)

   With chk(numChk)
      .Caption = nomChk
      .Value = 1
   End With
   
End Sub

'------------------------------------------------------------------------------
' Ajout des boutons options
'==============================================================================
Public Sub addChk(ByRef chk As Variant, ByVal nbrChk As Integer)
      
   While nbrChk > 0
    
      ' Ajout de la checkBox
      Load chk(nbrChk)
         
      ' Patamétrage de la checkbox
      With chk(nbrChk)
         .Enabled = True
         .Visible = True
         .Top = nbrChk * SZECHK + MRGHAU
      End With
      
      nbrChk = nbrChk - 1
      
   Wend

End Sub

'------------------------------------------------------------------------------
' Initialisation des boutons options de séléction des types supports
'==============================================================================
Public Sub iniChk(chk As Variant)
   Dim numChk As Integer
   
   numChk = chk.Count - 1
   
   While numChk > 0
      
      ' Suppression de tous les labels chargés
      Unload (chk.Item(numChk))
      numChk = numChk - 1
      
   Wend
   
End Sub

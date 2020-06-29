Attribute VB_Name = "ModChk"
Option Explicit

' Position des ChkBox pour les types supports
Const TPESUP_SZEOPT = 300
Const TPESUP_MRGHAU = 0

'------------------------------------------------------------------------------
' Affichage des boutons options pour la s�l�ction des type de r�f�rance
'==============================================================================
Public Sub chkSetTpr(tpeId As Long, chk As Variant)
   Dim tpe As New C_Type
   Dim numTpr As Integer
   
   ' Initialisation des checkBox
   chkIni chk
   
   ' Initialisation du type
   tpe.tpeId = tpeId
   
   ' Ajout des checkBox des types supports
   For numTpr = 1 To tpe.TprNbr
         
      ' Ajout de la checkBox
      Load chk(numTpr)
         
      ' Patam�trage de la checkbox
      With chk(numTpr)
         .Enabled = True
         .Visible = True
         .Top = numTpr * TPESUP_SZEOPT + TPESUP_MRGHAU
         .Caption = tpe.TprNom(numTpr)
         .Value = 1
      End With
      
   Next numTpr
   
   ' D�sallocation
   Set tpe = Nothing
   
End Sub

'------------------------------------------------------------------------------
' Affichage des boutons options pour la s�l�ction des types supports
'==============================================================================
Public Sub chkSetTps(tpeId As Long, chk As Variant)
   Dim tpe As New C_Type
   Dim numTps As Integer
   
   ' Initialisation des checkBox
   chkIni chk
   
   ' Instanciation du type
   tpe.tpeId = tpeId
   
   ' Ajout des checkBox des types supports
   For numTps = 1 To tpe.TpsNbr
         
      ' Ajout de la checkBox
      Load chk(numTps)
         
      ' Patam�trage de la checkbox
      With chk(numTps)
         .Enabled = True
         .Visible = True
         .Top = numTps * TPESUP_SZEOPT + TPESUP_MRGHAU
         .Caption = tpe.TpsNom
         .Value = 1
      End With
      
   Next numTps
   
   ' D�sallocation
   Set tpe = Nothing
   
End Sub

'------------------------------------------------------------------------------
' Ajout des boutons options pour la s�l�ction des types supports
'==============================================================================
Public Sub chkAdd(ByRef chk As Variant, ByVal nbr As Integer)
   Dim i As Integer
   
   While nbr > 0
    
      ' Ajout des labels
      i = i + 1
      Load chk(i)
      With chk(i)
         .Top = i * TPESUP_SZEOPT + TPESUP_MRGHAU
         .Enable
         .Visible = True
         .Value = 1
      End With
      
      nbr = nbr - 1
      
   Wend

End Sub

'------------------------------------------------------------------------------
' Initialisation des boutons options de s�l�ction des types supports
'==============================================================================
Public Sub chkIni(chk As Variant)
   Dim i As Integer
   
   i = chk.Count - 1
   
   While i > 0
      
      ' Suppression de tous les labels charg�s
      Unload (chk.Item(i))
      i = i - 1
      
   Wend
   
End Sub

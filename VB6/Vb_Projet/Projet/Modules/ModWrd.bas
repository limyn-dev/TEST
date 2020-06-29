Attribute VB_Name = "ModWrd"
Option Explicit

Const NOM_MODELE = "Rapport.doc" ' Nom dudocument vide
Const IDX_TBL_ATR = 1              ' Index de la table des attributs dans le rapport
Const IDX_TBL_CPS = 2              ' Index de la table des composant support dans le rapport

Private appWrd As New Word.Application  ' Application word
Private rptDoc As New Word.Document     ' Document du rapport
Private rptOk As Boolean                ' Flag d'ouverture du rapport

  
  
'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ RAPPORT §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ecriture d'un attribut dans la table du rapport
'==============================================================================
Public Sub atrAdd(lbl As String, val As String)

   If Not docOk Then ouvrir
   
   ' Ajout de la ligne dans la table
   lneAdd tbl
   
   ' Ajout des attributs dans la table
   wrtCel tbl, 1, lne, lbls(lne)
   wrtCel tbl, 2, lne, vals(lne)
      
End Sub

'------------------------------------------------------------------------------
' Initialisation du rapport
'==============================================================================
Public Sub rptIni()

   ' Ouverture du document
   rptOpn (NOM_MODELE)

   ' Initialisation de la table des attribut
   With rptDoc.Tables
      lneSetNbr .Item(IDX_TBL_ATR), 1
      celWrt .Item(IDX_TBL_ATR), 1, 1, "Attribut"
      celWrt .Item(IDX_TBL_ATR), 1, 2, "Valeur"
   End With
      
   
End Sub




'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ DOCUMENT §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ouverture d'un document word
'==============================================================================
Private Sub rptOpn(nomDoc As String)
   Dim chmFic As String
   
   If Not rptOk Then
   
      ' Chemin du fichier
      chmFic = App.Path & "\" & NOM_MODELE
      
      ' Ouverture du document
      On Error GoTo NoModele
      rptDoc.Open chmFic
          
      ' Flag d'ouverture du rapport
      rptOk = True
      
   End If
         
Exit Sub

NoModele:
   MsgBox "Impossible d'ouvrire le document:" & chmFic, vbCritical
   rptOk = False
    
End Sub

'------------------------------------------------------------------------------
' Fermenture du document et de l'application word
'==============================================================================
Private Sub rptCls()
    
   If rptOk Then
   
      ' Fermeture du document
      rptDoc.Close
      
      ' Cloture de l'application
      appWrd.Quit
      
      ' Désallocation
      docWrd = Nothing
      appWrd = Nothing
      
      ' Mise à jour du flag
      rptOk = False
      
   End If
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ TABLES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Création d' une table
'==============================================================================
Private Sub TblAdd()

    Set myRange = activedocument.Range(Start:=0, End:=0)
    activedocument.Tables.Add myRange, 3, 3
    
End Sub

'------------------------------------------------------------------------------
' mise à jour du nombre de ligne d'une table
'==============================================================================
Private Sub lneSetNbr(ByRef tbl As Word.Table, nbrLne As Integer)
   Dim numLne As Integer
   Dim tblLne As Integer
   
   ' Nombre de lignes de la table
   tblLne = tbl.Rows.Count
   
   If tblLne < nbrLne Then
   
      ' Ajout des ligne manquantes
      For numLne = tblLne + 1 To nbrLne
         lneAdd tbl
      Next numLne
      
   ElseIf tblLne > nbrLne Then
   
      ' Suppression des lignes superflues
      For numLne = tblLne To nbrLne + 1 Step -1
         lneDel tbl, numLne
      Next numLne
      
   End If
      
End Sub

'------------------------------------------------------------------------------
' Ajout d'une ligne à la fin d'une des table du document
'==============================================================================
Private Sub lneAdd(ByRef tbl As Word.Table)

   tbl.Rows.Add

End Sub

'------------------------------------------------------------------------------
' Suppression d'une ligne dans une des table du document
'==============================================================================
Private Sub lneDel(ByRef tbl As Word.Table, numLne As Long)

    tbl.Rows(numLne).Delete

End Sub

'------------------------------------------------------------------------------
' Ecriture dans une cellule d'une table du document
'==============================================================================
Private Sub celWrt(tbl As Word.Table, lne As Long, col As Long, txt As String)

   tbl.Cell(lne, col).Range.Text = txt
    
End Sub

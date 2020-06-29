Attribute VB_Name = "ModWrd"
Option Explicit

Const NOM_MODELE = "fiches\_Fiche.doc" ' Nom dudocument vide

Const IDX_TBL_DTA = 1   ' Index de la table des données du composant
Const IDX_TBL_ATR = 2   ' Index de la table des attributs dans le rapport
Const IDX_TBL_CPS = 3   ' Index de la table des composant support dans le rapport

Private appWrd As New Word.Application  ' Application word
Private doc As Word.Document     ' Document du rapport
Private docOk As Boolean                ' Flag d'ouverture du rapport

  
  
'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ FICHE §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Ecriture des données de l'entité dans la fiche
'==============================================================================
Public Sub dtaAdd(nom As String, tpe As String)
   Dim lne As Long
   
   If docOk Then
      
      ' Ajout des attributs dans la table
      celWrt doc.Tables(IDX_TBL_DTA), 1, 2, nom
      celWrt doc.Tables(IDX_TBL_DTA), 2, 2, tpe
   
   End If
      
End Sub

'------------------------------------------------------------------------------
' Ecriture d'un attribut dans la table du rapport
'==============================================================================
Public Sub atrAdd(lbl As String, val As String)
   Dim lne As Long
   
   If docOk Then
   
      ' Ajout de la ligne dans la table
      lneAdd doc.Tables(IDX_TBL_ATR)
   
      ' Nombre de ligne du tableau
      lne = doc.Tables(IDX_TBL_ATR).Rows.Count
      
      ' Ajout des attributs dans la table
      celWrt doc.Tables(IDX_TBL_ATR), lne, 1, lbl
      celWrt doc.Tables(IDX_TBL_ATR), lne, 2, val
   
   End If
      
End Sub

'------------------------------------------------------------------------------
' Ajout d'un support dans le tableau
'==============================================================================
Public Sub SupAdd(nom As String, tpe As String)
   Dim lne As Long
   
   If docOk Then
   
      ' Ajout de la ligne dans le tableau
      lneAdd doc.Tables(IDX_TBL_CPS)
   
      ' Nombre de ligne du tableau
      lne = doc.Tables(IDX_TBL_CPS).Rows.Count
      
      ' Ajout des valeur du support dans le tableau
      celWrt doc.Tables(IDX_TBL_CPS), lne, 1, nom
      celWrt doc.Tables(IDX_TBL_CPS), lne, 2, tpe
   
   End If
      
End Sub




'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ DOCUMENT §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Initialisation du rapport
'==============================================================================
Public Sub docIni()

   ' Ouverture du document
   docOpn (NOM_MODELE)

   
   If docOk Then
   
      With doc.Tables
      
         ' Initialisation de la table des attribut
         lneSetNbr .Item(IDX_TBL_ATR), 1
         celWrt .Item(IDX_TBL_ATR), 1, 1, "Nom de l'attribut"
         celWrt .Item(IDX_TBL_ATR), 1, 2, "Valeur de l'attribut"
         
         ' Initialisation de la table des supports
         lneSetNbr .Item(IDX_TBL_CPS), 1
         celWrt .Item(IDX_TBL_CPS), 1, 1, "Nom du support"
         celWrt .Item(IDX_TBL_CPS), 1, 2, "Valeur du support"
         
      End With
      
   End If
      
   
End Sub

'------------------------------------------------------------------------------
' Ouverture d'un document word
'==============================================================================
Private Sub docOpn(nomDoc As String)
   Dim chmFic As String
   
   If Not docOk Then
   
      ' Chemin du fichier
      chmFic = App.Path & "\" & NOM_MODELE
      
      ' Ouverture du document
      'On Error GoTo NoModele
      Set doc = appWrd.Documents.Open(chmFic)
          
      ' Flag d'ouverture du rapport
      docOk = True
      
   End If
         
Exit Sub

NoModele:
   MsgBox "Impossible d'ouvrire le document:" & chmFic, vbCritical
   docOk = False
    
End Sub

'------------------------------------------------------------------------------
' Fermenture du document et de l'application word
'==============================================================================
Public Sub docCls(nomFic As String)
   Dim chmFic As String
   
   If docOk Then
   
      ' Chemin du fichier
      chmFic = App.Path & "\fiches\" & nomFic
      ' Sauvegarde du document
      doc.SaveAs FileName:=chmFic
      
      ' Avertissement
      MsgBox "la fiche '" & chmFic & "' est créée.", vbInformation
      
      ' Fermeture du document
      doc.Close
      
      ' Cloture de l'application
      appWrd.Quit
      
      ' Désallocation
      Set doc = Nothing
      Set appWrd = Nothing
      
      ' Mise à jour du flag
      docOk = False
      
   End If
   
End Sub



'§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§ TABLES §§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§§

'------------------------------------------------------------------------------
' Création d' une table
'==============================================================================
Private Sub TblAdd()

    Set myRange = ActiveDocument.Range(Start:=0, End:=0)
    ActiveDocument.Tables.Add myRange, 3, 3
    
End Sub

'------------------------------------------------------------------------------
' mise à jour du nombre de ligne d'une table
'==============================================================================
Private Sub lneSetNbr(ByRef tbl As Word.Table, nbrLne As Integer)
   Dim numLne As Long
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

   On Error Resume Next
   tbl.Cell(lne, col).Range.Text = txt
    
End Sub

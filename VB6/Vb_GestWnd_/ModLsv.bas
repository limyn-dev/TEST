Attribute VB_Name = "ModLsv"
'------------------------------------------------------------------------------
' Ajout d'une ligne dans la lsv
'==============================================================================
Public Sub addLne(lsv As ComctlLib.ListView, id As Long, nom As String, attribs As Variant)
   Dim nbrLne As Integer
   Dim numAtr As Integer
   
   ' recherche du nombre de ligne de la listeview
   nbrLne = lsv.ListItems.Count
   
   ' Ajout de la ligne dans la lsv
   nbrLne = nbrLne + 1
   lsv.ListItems.Add nbrLne, hdlCle(id), nom
   
   ' Ajout des attributs de la ligne
   For numAtr = 1 To UBound(attribs)
      lsv.ListItems.Item(numlne).SubItems(numAtr) = attribs(numAtr)
   Next numAtr
      
End Sub

'------------------------------------------------------------------------------
' ajout d'une colonne dans la lsv
'==============================================================================
Public Sub addCol(ByRef lsv As ComctlLib.ListView, nomCol As String)

   ' Ajout d'une colonne
   With lsv.ColumnHeaders
      .Add
      .Item(numCol).Text = nomcols(numCol)
   End With
   
End Sub

'------------------------------------------------------------------------------
' Initialisation de la lsv
'==============================================================================
Public Sub initial(ByRef lsv As ComctlLib.ListView)

   ' Initialisation des colonnes
   lsv.ColumnHeaders.Clear
   
   ' Mode d'affichage
   lsv.View = lvwReport

End Sub

'------------------------------------------------------------------------------
' Convertion clef du Noeud <-> handel
'==============================================================================
Function hdlCle(hdl As Long) As String

    hdlCle = CStr(hdl) & "_"
    
End Function
Function CleHdl(cle As String) As Long

    CleHdl = CLng(Left(cle, Len(cle) - 1))
    
End Function





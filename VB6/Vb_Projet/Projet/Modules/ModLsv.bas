Attribute VB_Name = "ModLsv"
Option Explicit


'------------------------------------------------------------------------------
' Initialisation de la listView
'==============================================================================
Sub initialise(ByRef lsv As ListView, ByRef iml As ImageList, nomsCol As Variant)
   Dim nbrCol As Integer
   Dim numCol As Integer
   Dim nomCol As String
   Dim col As ColumnHeader
   
   ' Calcul du nombre de colonnes
   nbrCol = UBound(nomsCol)
   
   With lsv
   
      ' Mode d'affichage rapport
      .View = lvwReport
      
      ' Liste des icones
      .Icons = iml
      .SmallIcons = iml
      
      ' Création des colonnes
      For numCol = 1 To nbrCol
         .ColumnHeaders.Add , nomsCol(numCol), nomsCol(numCol)
      Next numCol
      
    
      
   End With
      
End Sub

'------------------------------------------------------------------------------
' Suppression de tous les éléments de la listView
'==============================================================================
Sub reset(ByRef lsv As ListView)

   ' Suppression de tous les entrées de lsv
   If lsv.ListItems.Count > 0 Then lsv.ListItems.Clear
   
End Sub

'------------------------------------------------------------------------------
' Ajout d'un composant
'==============================================================================
Sub cpoAdd(ByRef lsv As ListView, ByVal cpoId As Long)
   Dim cpo As New C_Composant
   Dim cle As String
   
   ' Valorisation du composant
   cpo.cpoId = cpoId
   
   ' Calcul de la clef
   cle = cpo_Key(cpo.cpoId)
   
   ' Insértion du cpo dans la lsv
   With lsv.ListItems
   
      ' Création de la ligne dans le lsv
      .Add , cle, cpo.CpoDsc, , CInt(cpo.tpeId)
      
      ' Ajout du type du composant dans le deuxième colonne
      .Item(cle).SubItems(1) = cpo.TpeNom
      
   End With
   
End Sub

'------------------------------------------------------------------------------
' Suppression d'un des composants de la lsv
'==============================================================================
Sub cpoDel(ByRef lsv As ListView, ByVal cpoId As Long)
   
   With lsv.ListItems
      .Remove (.Item(cpo_Key(cpoId)).Index)
   End With
   
End Sub

'------------------------------------------------------------------------------
' Calcul de la clef du composant en fonction de son id
'==============================================================================
Public Function cpo_Key(cpoId As Long) As String

   cpo_Key = "cpo" & "_" & CStr(cpoId)
   
End Function

'------------------------------------------------------------------------------
' Calcul de l'id du composant en fonction de la clef de l'item de la lsv
'==============================================================================
Public Function key_Cpo(itmKey As String) As Long

   key_Cpo = CLng(Right(itmKey, Len(itmKey) - 4))
   
End Function


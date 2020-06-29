Attribute VB_Name = "ModLsv"
Option Explicit

'------------------------------------------------------------------------------
' Ajout d'un noeud dans la listeview
'==============================================================================
Public Sub nodAdd(ByRef lsv As ListView, id As Long, nom As String)
   Dim nodCle As String
   Dim icoIdx As Integer
   
   ' Calcul de la clef du noeud
   nodCle = id_Cle(id)
   
   ' Calcul de l'index de l'image dans la liste des image de la listeview
   icoIdx = ModIml.id_idx(lsv.Icons, id)
   
   With lsv.ListItems
      On Error Resume Next
      .Add , nodCle, nom, , icoIdx
   End With
      
End Sub

'------------------------------------------------------------------------------
' Suppression d'un noeud dans une listeview
'==============================================================================
Public Sub nodDel(ByRef lsv As ListView, id As Long)
   Dim nodCle As String
   
   ' Calcul de la clef du noeud
   nodCle = id_Cle(id)
   
   ' Suppression du noeud de la listeview
   With lsv.ListItems
      .Remove (.Item(nodCle).Index)
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
' Initialisation d'une listView pour l'insértion de composant
'==============================================================================
Public Sub initial(ByRef lsv As ListView, ByRef iml As ImageList, nomsCol As Variant)
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
' Calcul de la clef d'un noeud en fonction d'un id
'==============================================================================
Public Function id_Cle(id As Long) As String

   id_Cle = "_" & CStr(id)
   
End Function

'------------------------------------------------------------------------------
' Calcul d'un Id en finction de la clef d'un noeud
'==============================================================================
Public Function cle_id(cle As String) As Long

   cle_id = CLng(Right(cle, Len(cle) - 1))
   
End Function


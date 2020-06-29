Attribute VB_Name = "ModIml"
Option Explicit

Const ICOTPEPTH = "icones"
Const ICOTLBPTH = "icones\tlb"

'------------------------------------------------------------------------------
' Initialisation d'une image liste avec les icones de la toolbar
'==============================================================================
Public Sub iniIcoTlb(ByRef iml As ImageList)
   
   ' Reset de la lsv
   iml.ListImages.Clear
   
   ' Insértion des l'images dans la liste des images pour la toolsbar
   With iml.ListImages
      .Add 1, , LoadPicture(App.Path & "\" & ICOTLBPTH & "\" & "addcpo.ico")
      .Add 2, , LoadPicture(App.Path & "\" & ICOTLBPTH & "\" & "delcpo.ico")
      .Add 3, , LoadPicture(App.Path & "\" & ICOTLBPTH & "\" & "edtcpo.ico")
      .Add 4, , LoadPicture(App.Path & "\" & ICOTLBPTH & "\" & "addTpe.ico")
      .Add 5, , LoadPicture(App.Path & "\" & ICOTLBPTH & "\" & "delTpe.ico")
      .Add 6, , LoadPicture(App.Path & "\" & ICOTLBPTH & "\" & "edtTpe.ico")
      .Add 7, , LoadPicture(App.Path & "\" & ICOTLBPTH & "\" & "fiche.ico")
   End With
   
   
End Sub

'------------------------------------------------------------------------------
' Initialisation d'une image liste avec les icones des types
'==============================================================================
Public Sub iniIcoTpe(ByRef iml As ImageList)
   Dim numIco As Long
   Dim nomIco As String
   Dim TpeId As Long
   
   ' Reset de la lsv
   iml.ListImages.Clear
   
   With ModDtb.tblTpe
   
      ' Initialisation du rst de la table des type
      .MoveFirst
        
      ' Ajout des images
      For numIco = 0 To .RecordCount - 1
         
         ' Nom de l'icone
         nomIco = App.Path & "\" & ICOTPEPTH & "\" & .Fields("TpeIco").Value
              
         ' Id du type
         TpeId = .Fields("TpeId_").Value
         
         ' Insértion de l'image dans la liste des images
         iml.ListImages.Add CInt(TpeId), id_Cle(TpeId), LoadPicture(nomIco)
         
         ' Type suivant
         .MoveNext
         
      Next numIco
      
   End With
   
End Sub

'------------------------------------------------------------------------------
' Calcl de la clef de l'image en fonction de l'id du type
'==============================================================================
Public Function id_idx(ByRef iml As ImageList, id As Long) As Integer
   
   id_idx = iml.ListImages.Item(id_Cle(id)).Index
   
End Function

'------------------------------------------------------------------------------
' Calcl de la clef de l'image en fonction de l'id du type
'==============================================================================
Public Function id_Cle(id As Long) As String

   id_Cle = "_" & CStr(id)
   
End Function

'------------------------------------------------------------------------------
' Calcul de l'id du type en fonction de la clef de l'image
'==============================================================================
Public Function cle_id(imgCle As String) As Long

   cle_id = CLng(Right(imgCle, Len(imgCle) - 1))
   
End Function


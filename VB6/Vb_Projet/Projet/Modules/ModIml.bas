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
      For numIco = 0 To .Fields.Count
         
         ' Nom de l'icone
         nomIco = App.Path & "\" & ICOTPEPTH & "\" & .Fields("TpeIco").Value
              
         ' Id du type
         TpeId = .Fields("TpeId_").Value
         
         ' Insértion de l'image dans la liste des images
         iml.ListImages.Add CInt(TpeId), tpe_Key(TpeId), LoadPicture(nomIco)
         
         ' Type suivant
         .MoveNext
         
      Next numIco
      
   End With
   
End Sub

'------------------------------------------------------------------------------
' Calcl de la clef de l'image en fonction de l'id du type
'==============================================================================
Public Function tpe_Key(TpeId As Long) As String

   tpe_Key = "imgTpe" & "_" & CStr(TpeId)
   
End Function

'------------------------------------------------------------------------------
' Calcul de l'id du type en fonction de la clef de l'image
'==============================================================================
Public Function key_Tpe(imgKey As String) As Long

   key_Tpe = CLng(Right(imgKey, Len(imgKey) - 7))
   
End Function


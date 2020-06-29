Attribute VB_Name = "ModTrv"
Option Explicit

'------------------------------------------------------------------------------
' Chargement des entités de même type et de leur entités liées
'==============================================================================
Public Sub addCpoTpe(ByRef trv As TreeView, TpeId As Long)
   Dim lstCpo As New C_LstCpo
   Dim cpo As New C_Composant
   Dim numCpo As Integer
   Dim imgIdx As Integer
   
   ' clef de l'icone du type dans l'image liste
   imgIdx = ModIml.id_idx(trv.ImageList, TpeId)
   
   ' Initialisation de la liste des composants de même type
   lstCpo.LstTpeId = TpeId
   
   ' Insértion des composants
   For numCpo = 1 To lstCpo.CpoNbr
   
      ' Création du noeud
      With lstCpo.CpoNum(numCpo)
         trv.Nodes.Add , , cpo_Key(.cpoId, ""), .CpoDsc, imgIdx
      End With
      
   Next numCpo
   
End Sub

'------------------------------------------------------------------------------
' Chargement des composants supports du composant père
'==============================================================================
Public Sub addCps(ByRef trv As TreeView, clePere As String)
   Dim cpoPere As New C_Composant
   Dim cpoFils As New C_Composant
   Dim imgIdx As Integer
   Dim numCps As Integer
   
   ' Initialisation du composant pere
   cpoPere.cpoId = key_Cpo(clePere)

   ' Insértion des composant support du pere dans le trv
   For numCps = 1 To cpoPere.CpsNbr
      
      ' Initialisation du composant fils
      cpoFils.cpoId = cpoPere.cpsId(numCps)
      
      ' Insértion du fils dans le trv
      With cpoFils
         
         ' Calcul de l'index de l'image dans l'image liste
         imgIdx = ModIml.id_idx(trv.ImageList, .TpeId)
         
         ' Insértion du noeud
         On Error Resume Next
         trv.Nodes.Add clePere, tvwChild, cpo_Key(.cpoId, clePere), .CpoDsc, imgIdx
         
      End With
      
      
   Next numCps

   ' Désallocation
   Set cpoFils = Nothing
   Set cpoPere = Nothing
   
End Sub

'------------------------------------------------------------------------------
' Chargement des composants qui ont comme support le composant père
'==============================================================================
Public Sub addCpc(ByRef trv As TreeView, clePere As String)
   Dim lstCpc As New C_LstCpo
   Dim imgIdx As Integer
   Dim numCpo As Integer
   
   ' Initialisation de la liste des composant contenu dans le composant père
   lstCpc.LstCpcId = key_Cpo(clePere)

   ' Insértion des composants de la liste dans le treeview
   For numCpo = 1 To lstCpc.CpoNbr
      With lstCpc.CpoNum(numCpo)
      
         ' Calcul de l'index de l'image dans l'image liste
         imgIdx = ModIml.id_idx(trv.ImageList, .TpeId)
         
         ' Insértion du noeud dans le treeview
         On Error Resume Next
         trv.Nodes.Add clePere, tvwChild, cpo_Key(.cpoId, clePere), .CpoDsc, imgIdx
         
      End With
   Next numCpo
   
End Sub

'------------------------------------------------------------------------------
' Initialise le trv
'==============================================================================
Public Sub initialise(ByRef trv As TreeView, ByRef iml As ImageList)

   With trv
      .ImageList = iml
      .FullRowSelect = False
      .Style = tvwTreelinesPictureText
      .SingleSel = False
      .HideSelection = False
      .LabelEdit = tvwManual
   End With
   
End Sub

'------------------------------------------------------------------------------
' Calcul la cle en fonction de l'id du composant et de la cle du composant Père
'==============================================================================
Public Function cpo_Key(cpoId As Long, clePere As String) As String

   cpo_Key = clePere & "_" & CStr(cpoId)
   
End Function

'------------------------------------------------------------------------------
' Calcul l'Id du composant en fonction de la cle
'==============================================================================
Public Function key_Cpo(cle As String) As Long
   Dim sep As Integer
   Dim lng As Integer
   
   sep = Len(cle)

   ' Recherche du caractère séparateur
   Do
      If Mid(cle, sep, 1) = "_" Then
         Exit Do
      Else
         sep = sep - 1
      End If
      
   Loop While sep > 1
   
   ' Calcul de la valeur de l'id
   key_Cpo = CLng(Right(cle, Len(cle) - sep))
       
End Function



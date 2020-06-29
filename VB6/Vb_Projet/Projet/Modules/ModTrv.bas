Attribute VB_Name = "ModTrv"
Option Explicit

'------------------------------------------------------------------------------
' Chargement des entit�s de m�me type et de leur entit�s li�es
'==============================================================================
Public Sub addCpoTpe(ByRef trv As TreeView, tpeId As Long)
   Dim lstCpo As New C_LstCpo
   Dim cpo As New C_Composant
   Dim numCpo As Integer
   Dim img As String
   
   ' clef de l'icone du type dans l'image liste
   img = ModIml.tpe_Key(tpeId)
   
   ' Initialisation de la liste des composants
   lstCpo.tpeId = tpeId
   
   ' Ins�rtion des composants
   For numCpo = 1 To lstCpo.CpoNbr
   
      ' Initialisation du composant
      cpo.CpoId = lstCpo.CpoId(numCpo)
      
      ' Cr�ation du noeud
      With cpo
         'On Error Resume Next
         trv.Nodes.Add , , cpo_Key(.CpoId, ""), .CpoDsc, img
      End With
      
   Next numCpo
   
End Sub

'------------------------------------------------------------------------------
' Chargement d'un noeud � un endroit du trv (sous un noeud existant)
'==============================================================================
Public Sub addCpoLnk(ByRef trv As TreeView, clePere As String)
   Dim cpoPere As New C_Composant
   Dim cpoFils As C_Composant
   Dim img As String
   Dim numSup As Integer
   
   ' Cr�ation du composant pere
   cpoPere.CpoId = key_Cpo(clePere)

   ' Ins�rtion des composant support du pere dans le trv
   For numSup = 1 To cpoPere.CpsNbr
      
      ' Cr�ation du composant fils
      Set cpoFils = New C_Composant
      cpoFils.CpoId = cpoPere.cpsId(numSup)
      
      ' Ins�rtion du fils dans le trv
      On Error Resume Next
      trv.Nodes.Add clePere, _
                    tvwChild, _
                    cpo_Key(cpoFils.CpoId, clePere), _
                    cpoFils.CpoDsc, _
                    ModIml.tpe_Key(cpoFils.tpeId)
      
      ' D�sallocation du coposant fils
      Set cpoFils = Nothing
      
   Next numSup

   ' D�sallocation du cpoPere
   Set cpoPere = Nothing
   
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
' Calcul la cle en fonction de l'id du composant et de la cle du composant P�re
'==============================================================================
Public Function cpo_Key(CpoId As Long, clePere As String) As String

   cpo_Key = clePere & "_" & CStr(CpoId)
   
End Function

'------------------------------------------------------------------------------
' Calcul l'Id du composant en fonction de la cle
'==============================================================================
Public Function key_Cpo(cle As String) As Long
   Dim sep As Integer
   Dim lng As Integer
   
   sep = Len(cle)

   ' Recherche du caract�re s�parateur
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



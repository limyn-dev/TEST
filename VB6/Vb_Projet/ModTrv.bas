Attribute VB_Name = "ModTrv"
Option Explicit

'------------------------------------------------------------------------------
' Chargement des entit�s de m�me type et de leur entit�s li�es
'==============================================================================
Public Sub addCpoTpe(ByRef trv As ComctlLib.TreeView, tpeIdPere As Long)
   Dim Cpos As ADODB.Recordset
   Dim cle As String
   Dim Nom As String
   Dim img As String
   
   ' R�f�rence sur l'image
   img = "Tpe_" & CStr(tpeIdPere)
   
   ' Recherche des entit�s du type
   Set Cpos = ModDtb.ExecCmdId("TpeCpo", tpeIdPere)
   
   ' Ins�rtion des entit�s
   While Not Cpos.EOF
   
      ' Cr�ation du noeud
      With Cpos.Fields
         cle = "_" & CStr(.Item("CpoId_").Value)
         Nom = .Item("CpoNom").Value
         trv.Nodes.Add , , cle, Nom, img
      End With
         
      ' Cr�ation des noeuds li�s
      'addCpoLnk trv, cle
      
      ' Entit� suivante
      Cpos.MoveNext
      
   Wend
   
   ' D�sallocation
   Cpos.Close
   Set Cpos = Nothing
   
End Sub

'------------------------------------------------------------------------------
' Chargement d'un noeud � un endroit du trv
'==============================================================================
Public Sub addCpoLnk(ByRef trv As ComctlLib.TreeView, clePere As String)
   Dim Cpos As ADODB.Recordset
   Dim CpoIdPere As Long
   Dim cle As String
   Dim Nom As String
   Dim img As String
   
   ' Calcule de l'Id de l'entit�
   CpoIdPere = calcId(clePere)

   ' Recherche des entit�s li�es
   Set Cpos = ModDtb.ExecCmdId("CpoLnk", CpoIdPere)
   
   ' Is�rtion des entit�s
   While Not Cpos.EOF
         
      ' Cr�ation du noeud
      With Cpos.Fields
         cle = clePere & "_" & CStr(.Item("CpoId_").Value)
         Nom = .Item("CpoNom").Value
         img = "Tpe_" & CStr(.Item("CpoTpeId_").Value)
         trv.Nodes.Add clePere, tvwChild, cle, Nom, img
      End With
      
      ' Cr�ation des noeuds li�s
      addCpoLnk trv, cle
      
      ' Entit� suivante
      Cpos.MoveNext
      
   Wend
   
   ' D�sallocation
   Cpos.Close
   Set Cpos = Nothing
   
End Sub

'------------------------------------------------------------------------------
' Calcul des Id du type et de la description de l'entite en fonction de la clef
'==============================================================================
Public Function calcId(cle As String) As Long
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
   calcId = CLng(Right(cle, Len(cle) - sep))
       
End Function


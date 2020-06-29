Attribute VB_Name = "mdlDHTML"
Option Explicit



' Détail des éléments dans une ritchtextbox
'______________________________________________________________________________________________________________________
Public Sub LoadRtbElm(oElm As Object, oRtb As RichTextBox)

   On Error Resume Next
   With oRtb
      .Text = oElm.outerHTML
   End With
End Sub



' Détail des éléments
'______________________________________________________________________________________________________________________
Public Function ElmToHtm(oElm As Object)
   Dim sHtm As String
   
   On Error Resume Next
   With oElm
      'sHtm = sHtm & "<CENTER>"
      sHtm = sHtm & "  <TABLE border=""1"">"
      sHtm = sHtm & "    <TR><TD>" & "Left        " & "</TD><TD>" & CStr(.Left) & "        </TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "Top         " & "</TD><TD>" & CStr(.Top) & "         </TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "Witdth      " & "</TD><TD>" & CStr(.Width) & "       </TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "Height      " & "</TD><TD>" & CStr(.Height) & "      </TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "clientLeft  " & "</TD><TD>" & CStr(.clientLeft) & "  </TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "clientTop   " & "</TD><TD>" & CStr(.clientTop) & "   </TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "clientWitdth" & "</TD><TD>" & CStr(.clientWidth) & " </TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "clientHeight" & "</TD><TD>" & CStr(.clientHeight) & "</TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "outerText   " & "</TD><TD>" & .outerText & "         </TD></TR>"
      sHtm = sHtm & "    <TR><TD>" & "outerHtml   " & "</TD><TD>" & .outerHTML & "         </TD></TR>"
      sHtm = sHtm & "  </TABLE>"
      'sHtm = sHtm & "<CENTER>"
   End With
   
   ' Retour des valeurs
   ElmToHtm = sHtm
   
End Function



' Chargement des élément dans un treeview
'______________________________________________________________________________________________________________________
Public Sub LoadChild(ByRef oTrv As TreeView, sKeyOvr As String, ByRef oElm As Object)
   Dim nItm As Long
   Dim sKey As String
   Dim sNme As String
   Dim oChl As Object
   
   ' Parcourt des élément de la collection
   For nItm = 0 To oElm.length - 1
      With oElm(nItm)
      
         ' Clef du noeud
         If .Id = "" Then
            sKey = sKeyOvr & "_" & CStr(nItm)
            .Id = sKey
         Else
            sKey = .Id
         End If
      
         ' Nom du noeud
         sNme = ""
         On Error Resume Next: sNme = sNme & "<" & .tagName & ">"
         'On Error Resume Next: sNme = sNme & .outerText
         On Error Resume Next: sNme = sNme & " / Left:" & .Left
         On Error Resume Next: sNme = sNme & " / Top:" & .Top
         On Error Resume Next: sNme = sNme & " / Witdth:" & .Width
         On Error Resume Next: sNme = sNme & " / Height:" & .Height
         On Error Resume Next: sNme = sNme & " / clientLeft:" & .clientLeft
         On Error Resume Next: sNme = sNme & " / clientTop:" & .clientTop
         On Error Resume Next: sNme = sNme & " / clientWitdth:" & .clientWidth
         On Error Resume Next: sNme = sNme & " / clientHeight:" & .clientHeight
         
      End With
      
      ' Ajout du noeud dans le treeview
      With oTrv.Nodes
         If .Item(sKeyOvr).children > 0 Then
            .Add .Item(sKeyOvr).Child.Key, tvwLast, sKey, sNme
         Else
            .Add sKeyOvr, tvwChild, sKey, sNme
         End If
      End With
      
      ' Ajout des sous noeuds
      Set oChl = oElm(nItm).children
      If oChl.length > 0 Then LoadChild oTrv, sKey, oChl
   
   Next nItm
End Sub


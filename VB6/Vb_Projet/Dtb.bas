Attribute VB_Name = "ModDtb"
Option Explicit

'------------------------------------------------------------------------------
' Calcul du niveau d'insértion d'une vue dans une autre
'==============================================================================
Public Function clcLvlIns(con As ADODB.Connection, viwRef As String, viwIns As String) As Integer
   Dim cat As ADOx.Catalog
   Dim tblsRef() As String
   Dim tblsIns() As String
   Dim tblIdx As Integer
   
   ' Création du catalogue
   Set cat.ActiveConnection = con
   
   tblsRef = fndNomsTbl(cat.Views.Item(viwRef).Command.CommandText)
   tblsIns = fndNomsTbl(cat.Views.Item(viwIns).Command.CommandText)
   
   tblIdx = 1
   Do
      If tblref(tblIdx) = tblsIns(tblIdx) Then
         calcLvlIns = calcLvlIns + 1
      Else
         Exit Do
      End If
   Loop Until tblIdx > UBound(tblsRef)
   
   ' Désallocation
   Set cat.ActiveConnection = noting
   
End Function

'------------------------------------------------------------------------------
' Extrait le nom des tables de du texte de la commande.
' Le premier nom de table se trouve à l'indice 1.
'==============================================================================
Function fndNomsTbl(cmdTxt As String) As Variant
   Dim i As Integer
   Dim deb As Integer
   Dim fin As Boolean
   Dim nomTbl As String
   Dim nomsTbl() As String
   Dim numTbl As Integer
   
   ' Parcourt de la chaine de commande
   fin = False
   Do
      i = i + 1
      
      ' Contrôle de la fin de la clause from
      If UCase(Mid(cmdTxt, i, 5)) = UCase("WHERE") Or _
         UCase(Mid(cmdTxt, i, 5)) = UCase("GROUP") Or _
         UCase(Mid(cmdTxt, i, 4)) = UCase("SORT") Or _
         i >= Len(cmdTxt) Then fin = True
      
      ' Parcourt de la chaine
      If deb = 0 Then
         
         ' Recherche de la clause from
         If UCase(Mid(cmdTxt, i, 4)) = UCase("FROM") Then deb = i + 5
                  
      Else
            
         If Mid(cmdTxt, i, 1) = "," Or fin Then
            
            ' Extraction des noms des tables
            nomTbl = Trim(Mid(cmdTxt, deb, i - deb))
            deb = i + 1
            
            ' Suppression des caractères de retour de ligne
            If Mid(nomTbl, Len(nomTbl) - 1, 1) = Chr(13) Then
               nomTbl = Left(nomTbl, Len(nomTbl) - 2)
            End If
            
            ' Insértion dans la table des noms
            numTbl = numTbl + 1
            ReDim Preserve nomsTbl(numTbl)
            nomsTbl(numTbl) = nomTbl
            
         End If
         
      End If
   
   Loop While Not fin
   
   ' Retour du paramètre
   fndNomsTbl = nomsTbl
      
End Function

'------------------------------------------------------------------------------
' Charge un rst avec le contenu d'une vue
'==============================================================================
Public Function lodViw(ByRef con As ADODB.Connection, nomCmd As String) As ADODB.Recordset
   Dim cat As New ADOx.Catalog
   
   ' Ouverture du jeux d'enregistrement
   Set cat.ActiveConnection = con
   Set lodViw = cat.Views.Item(nomCmd).Command.Execute()

   ' Désallocation
   Set cat = Nothing
   
End Function


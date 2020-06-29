Attribute VB_Name = "db_Tbl"

'******************************************************************************
' Description  :  Outils pour la gestion des tables d'une connexion.
' Auteur       :  Yves Delay
' Date         :  29/03/2001
' Abréviations :  Talbe          -> Tbl
'                 Recordeset     -> Rst
'                 field          -> Fld
'                 MSHFlexGrid    -> Hfg
'                 DBListeBox     -> Dbl
'                 DBCombobox     -> Dbc
'                 DataListeBox   -> Dtl
'                 DataComboBox   -> Dtc
'*******************************************************************************
Option Explicit

' liste des type de tables d'une connexion
Public Enum T_TpeTbl
   TBLALL = 0
   TBLSTD = 1
   TBLSYS = 2
   TBLGBL = 3
End Enum


'------------------------------------------------------------------------------
' Renvoie la chaine du type de table en fonction du type
'==============================================================================
Public Function defTpeTbl(tpeTbl As T_TpeTbl) As String

   Select Case (tpeTbl)
      Case TBLALL
         defTpeTbl = ""
      Case TBLSTD
         defTpeTbl = "TABLE"
      Case TBLSYS
         defTpeTbl = "SYSTEM TABLE"
      Case TBLGBL
         defTpeTbl = "GLOBAL TEMPORARY"
   End Select
   
End Function


'------------------------------------------------------------------------------
' Recherche la liste des noms des tables
'==============================================================================
Function foundLstFld(con As ADODB.Connection, nomTbl As String) As Variant

   ' Création du rst
   Dim rst As ADODB.Recordset
   Set rst = New ADODB.Recordset
   rst.Open nomTbl, con, adOpenKeyset, adLockReadOnly
   
   ' Recherche la liste des fld
   Dim lst() As String
   Dim iFld As Integer
   Dim fld As ADODB.Field
   For Each fld In rst.Fields
      iFld = iFld + 1
      ReDim Preserve lst(iFld)
      lst(iFld) = fld.Name
   Next fld
      
   ' Passage du paramètre
   foundLstFld = lst
   
   ' libération des allocations
   rst.Close
   Set rst = Nothing
   
End Function


'------------------------------------------------------------------------------
' Renvoie un champ d'une table
'==============================================================================
Function foundFld(con As ADODB.Connection, nomTbl As String, nomFld As String) As Variant

   ' Création du rst
   Dim rst As ADODB.Recordset
   Set rst = New ADODB.Recordset
   rst.Open nomTbl, con, adOpenKeyset, adLockReadOnly
   
   ' recherche du champ
   Dim fld As ADODB.Field
   For Each fld In rst.Fields
      If fld.Name = nomFld Then foundFld = fld
   Next fld
      
   ' libération des allocations
   rst.Close
   Set rst = Nothing
   
End Function


'------------------------------------------------------------------------------
' Mise àjour d'une dataliste en fonction des données d'un champ
'==============================================================================
Public Sub loadDtlFld(con As ADODB.Connection, nomTbl As String, nomFld As String, ByRef dtl As DataList)

   ' Création du rst
   Dim rst As ADODB.Recordset
   Set rst = New ADODB.Recordset
   rst.Open nomTbl, con, adOpenKeyset, adLockReadOnly
   
   ' Affectation de la dtl
   Set dtl.RowSource = rst
   Set dtl.ListField = nomFld
   
   ' libération de l'allocation
   Set rst = Nothing
   
End Sub


'------------------------------------------------------------------------------
' Mise àjour d'une MSHFlexGrid en fonction des données d'une table
'==============================================================================
Public Sub loadHfgTbl(con As ADODB.Connection, nomTbl As String, ByRef hfg As MSHFlexGrid)
        
    ' Libération de l'ancien rst
    Set hfg.DataSource = Nothing
    
    ' Création d'un recordset sur la table
    Dim rst As New ADODB.Recordset
    rst.Open nomTbl, con, adOpenStatic
    
    ' Chargement de la mshflexgrid
    Set hfg.DataSource = rst
    
End Sub


'------------------------------------------------------------------------------
' Renvoie un tableau des noms des tables d'une connection
'==============================================================================
Public Function foundLstTbl(con As ADODB.Connection, tpeTbl As T_TpeTbl) As Variant
   Dim lst() As String
   Dim strTpe As String
   Dim iTbl As Integer
   
   ' Création du catalogue
   Dim cat As New ADOX.Catalog
   cat.ActiveConnection = con
   
   ' recherche du type de table
   strTpe = defTpeTbl(tpeTbl)
   
   ' Création de la liste des table
   Dim tbl As New ADOX.Table
   ReDim lst(1)
   For Each tbl In cat.Tables
      
      If strTpe = "" Or tbl.Type = strTpe Then
         ReDim Preserve lst(iTbl)
         lst(iTbl) = tbl.Name
         iTbl = iTbl + 1
      End If
        
    Next tbl
   
    foundLstTbl = lst
   
End Function


'------------------------------------------------------------------------------
' Rempissage d'une comboBox avec les nom des tables d'une connection
'==============================================================================
Private Sub loadCbo(ByRef cbo As ComboBox, lst As Variant)

   With cbo
   
      ' Reset de la cbo
      .Clear
      
      ' Insertion des valeurs dans la cbo
      Dim i As Integer
      For i = 0 To UBound(lst)
         .AddItem lst(i), i
      Next i
   
   
   End With
   
End Sub


'------------------------------------------------------------------------------
' Rempissage d'une comboBox avec les nom des tables d'une connection
'==============================================================================
Sub loadCboLstTbl(con As ADODB.Connection, tpeTbl As T_TpeTbl, ByRef cbo As ComboBox)

   ' lecture de la liste des tables de la DB
   Dim lst As Variant
   lst = foundLstTbl(con, tpeTbl)
   
   ' Chargement de la cbo
   loadCbo cbo, lst


End Sub


'------------------------------------------------------------------------------
' Rempissage d'une comboBox avec les nom des tables d'une connection
'==============================================================================
Sub loadCboLstFld(con As ADODB.Connection, nomTbl As String, ByRef cbo As ComboBox)

   ' Recherche la liste des champs d'une table
   Dim lst As Variant
   lst = foundLstFld(con, nomTbl)
   
   ' Chargement de la cbo
   loadCbo cbo, lst

End Sub


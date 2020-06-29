Attribute VB_Name = "db_prc"
'******************************************************************************
' Description  :  Outils pour la gestion des Procedures d'une connexion.
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
'                 Procedure      -> Prc
'                 Commande       -> Cmd
'                 Paramètre      -> Prm
'*******************************************************************************
Option Explicit


'------------------------------------------------------------------------------
' Renvoie la liste des procedures d'une connection
'==============================================================================
Public Function foundLstPrc(con As ADODB.Connection) As Variant
    Dim lst() As String
    Dim iPrc As Integer
   
    ' Ouverture du catalogue
    Dim cat As New ADOX.Catalog
    cat.ActiveConnection = con
   
    Dim prc As ADOX.Procedure
   
    ReDim lst(1)
    For Each prc In cat.Procedures
        ReDim Preserve lst(iPrc)
        lst(iPrc) = prc.Name
        iPrc = iPrc + 1
    Next prc
   
   foundLstPrc = lst
   
End Function


'------------------------------------------------------------------------------
' Rempissage d'une comboBox avec les nom des procédures d'une connection
'==============================================================================
Sub loadCboLstPrc(con As ADODB.Connection, ByRef cmbBox As ComboBox)

  ' lecture de la liste des tables de la DB
   Dim lst As Variant
   lst = foundLstPrc(con)
   
   ' Initialisation de la comboBox avec les noms des tables
   Dim i As Integer
   With cmbBox
      .Clear
      For i = 0 To UBound(lst)
         .AddItem lst(i), i
      Next i
   End With

End Sub


'------------------------------------------------------------------------------
' Renvoie le text d'une commande en fonction du nom de la commande
'==============================================================================
Public Function foundTxtPrc(con As ADODB.Connection, nomPrc As String) As String

    If nomPrc <> "" Then
    
      ' Création du catalogue
      Dim cat As New ADOX.Catalog
      Set cat.ActiveConnection = con
    
      ' Recherche de la commande
      Dim cmd As New ADODB.Command
      Set cmd = cat.Procedures(nomPrc).Command
    
      ' Lecture du texte de la commande
      foundTxtPrc = cmd.CommandText
    
      ' Suppression des allocations
      Set cmd = Nothing
      Set cat = Nothing
      
   End If
    
End Function


'------------------------------------------------------------------------------
' Renvoie le nombre de paramètre d'une commande en fonction du nom de la commande
'==============================================================================
Public Function foundNbrPrm(con As ADODB.Connection, nomPrc As String) As Variant

   ' Création du catalogue
    Dim cat As New ADOX.Catalog
    Set cat.ActiveConnection = con
    
    ' Recherche de la commande
    Dim cmd As New ADODB.Command
    Set cmd = cat.Procedures(nomPrc).Command
    
    ' Passage du paramètre
    foundNbrPrm = cmd.Parameters.Count
    
    ' Suppression des allocations
    Set cmd = Nothing
    Set cat = Nothing
    
End Function

'------------------------------------------------------------------------------
' Renvoie le nombre de paramètre d'une commande en fonction du nom de la commande
'==============================================================================
Public Function foundLstPrm(con As ADODB.Connection, nomPrc As String) As Variant

   ' Création du catalogue
    Dim cat As New ADOX.Catalog
    Set cat.ActiveConnection = con
    
    ' Recherche de la commande
    Dim cmd As New ADODB.Command
    Set cmd = cat.Procedures(nomPrc).Command
    
    ' Lecture des paramètres de la commande
    Dim iPrm As Integer
    iPrm = 1
    Dim lst() As String
    ReDim lst(iPrm)
    For iPrm = 1 To cmd.Parameters.Count
        lst(iPrm) = cmd.Parameters(iPrm).Name
        iPrm = iPrm + 1
        ReDim Preserve lst(iPrm)
    Next iPrm
    
    ' Passage du paramètre
    foundLstPrm = lst
    
    ' Suppression des allocations
    Set cmd = Nothing
    Set cat = Nothing
    
End Function


'------------------------------------------------------------------------------
' Charge une MSHFlexGrid (hfg) avec le résultat d'une commande
'==============================================================================
Public Sub loadHfgPrc(con As ADODB.Connection, nomPrc As String, params As Variant, ByRef hfg As MSHFlexGrid)

    ' Création du catalogue
    Dim cat As New ADOX.Catalog
    Set cat.ActiveConnection = con
    
    ' Recherche de la commande
    Dim cmd As New ADODB.Command
    Set cmd = cat.Procedures(nomPrc).Command
   
    ' Valorisatiion des paramètres
    Dim iPrm As Integer
    For iPrm = 1 To UBound(params)
        cmd.Parameters(iPrm) = params(iPrm)
    Next iPrm
     
    ' Mise à jour de la hfg
    Set hfg.DataSource = Nothing
    Set hfg.DataSource = cmd.Execute
   
    ' Suppression des allocations
    Set cmd = Nothing
    Set cat = Nothing
    
End Sub


'------------------------------------------------------------------------------
' création d'une nouvelle procedure
'==============================================================================
Public Sub createPrc(con As ADODB.Connection, nomPrc As String, txtcmd As String)

   ' Création du catalogue
   Dim cat As New ADOX.Catalog
   Set cat.ActiveConnection = con
   
   ' Création de la commande
   Dim cmd As New ADODB.Command
   cmd.CommandText = txtcmd
   
   ' Ajout de la commande
   cat.Procedures.Append nomPrc, cmd

   ' Libération des allocations
   Set cmd = Nothing
   Set cat = Nothing
   
End Sub






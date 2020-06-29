VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CDbODBC"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Private Con As ADODB.Connection
Private Cat As ADOX.Catalog

Public Sub Ouvrir(nomDb As String)
    Dim strCon As String
    strCon = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & nomDb & ";"
    
    ' Création de la connexion
    Set Con = New ADODB.Connection
    Con.Open strCon, "Admin", ""
    
    ' Création du catalogue
    Set Cat = New ADOX.Catalog
    Cat.ActiveConnection = Con
    
End Sub
Public Sub Fermer()

    Set Cat = Nothing
    Con.Close
    Set Con = Nothing
    
End Sub
Public Sub AjouterTable(nomTable As String)
    Dim tbl As New ADOX.Table
    
    tbl.Name = nomTable
    Cat.Tables.Append tbl

End Sub
Public Sub AjouterChamp(nomTable As String, nomChamp As String, typeChamp As ADOX.DataTypeEnum)
    Dim fld As New ADOX.Column
    Dim tbl As ADOX.Table
    
    fld.Name = nomChamp
    fld.Type = adInteger
    
    For Each tbl In Cat.Tables
        If tbl.Name = nomTable Then tbl.Columns.Append fld
    Next tbl
    
End Sub


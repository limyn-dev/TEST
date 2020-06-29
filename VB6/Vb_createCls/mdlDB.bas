Attribute VB_Name = "mdlDB"
Option Explicit

Private myCon As ADODB.Connection

Public pathMdb As String
Public Catalogue As ADOX.Catalog

' Connexion à la base de données
'------------------------------------------------------------------------------
Public Sub connecter()
    Dim strCon As String
    strCon = "Provider=Microsoft.Jet.OLEDB.4.0;" & _
             "Data Source=" & pathMdb & ";" & _
             "User ID=admin;" & _
             "Password=;"
    Set myCon = New ADODB.Connection
    myCon.Open strCon
    Set Catalogue = New ADOX.Catalog
    Catalogue.ActiveConnection = myCon
End Sub

' Déconnexion de la db
'------------------------------------------------------------------------------
Public Sub deconnecter()
    myCon.Close
    Set Catalogue = Nothing
    Set myCon = Nothing
End Sub

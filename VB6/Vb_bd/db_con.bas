Attribute VB_Name = "db_con"
Option Explicit

Public Const ODBCDB = "MSDASQL"                 ' ODBC->OLEDB
Public Const IDXSRV = "MSIDXS"                  ' Index Server->OLEDB
Public Const ACTDIR = "ADSDSOObject"            ' Active Directory Service->OLEDB
Public Const SQLSRV = "SQLOLEDB"                ' SQL Server->OLEDB
Public Const ORACLE = "MSDAORA"                 ' Oracle->OLEDB
Public Const JETDBS = "Microsoft.Jet.OLEDB.4.0" ' Jet->OLEDB


'------------------------------------------------------------------------------
' Ouverture d'une ADODB.connection
'==============================================================================
Public Function ouvrirJet(chemDb As String, usr As String, psw As String) As ADODB.Connection
   Dim strCon As String
   
   Set ouvrirJet = New ADODB.Connection
   
   ouvrirJet.Provider = JETDBS
   ouvrirJet.ConnectionString = chemDb
   
   ' Création de la chaine de connection
   If usr <> "" And psw <> "" Then
      strCon = strCon & "Userid=" & usr & "; password=" & psw
   ElseIf usr <> "" Then
      strCon = strCon & "UserId=" & usr
   ElseIf psw <> "" Then
      strCon = strCon & "Password=" & psw
   End If
      
   ' Ouverture de la connection
   ouvrirJet.Open strCon
   
End Function

'------------------------------------------------------------------------------
' Fermeture d'une ADODB.connection
'==============================================================================
Public Sub fermerCon(con As ADODB.Connection)

   con.Close
   Set con = Nothing
   
End Sub


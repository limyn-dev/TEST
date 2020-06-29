Attribute VB_Name = "M_Db"
Option Explicit

Public dtb As ADODB.Connection
Public tbl As ADODB.Recordset

'------------------------------------------------------------------------------
'  Initialisation des accès sur la db
'==============================================================================
Public Sub dbOpen()
   
   ' Acces à la DB
   Set dtb = New ADODB.Connection
   dtb.Provider = "Microsoft.Jet.OLEDB.3.51"
   dtb.Open App.Path & "\db1.mdb", "Admin", ""
   
   ' Acces à la table1
   Set tbl = New ADODB.Recordset
   tbl.Open "Table1", dtb
   
End Sub
'------------------------------------------------------------------------------
Public Sub dbClose()

   ' Tables
   tbl.Close
   Set tbl = Nothing
   
   ' DB
   dtb.Close
   Set dtb = Nothing
   
End Sub

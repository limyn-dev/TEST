Attribute VB_Name = "mdlDbIO"
Option Explicit

Const STRCON = "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=familles.mdb;"

Dim con As New ADODB.Connection

Type T_Prs
   Nom As String
   

'------------------------------------------------------------------------------
' recherche des enfants d'une famille
'==============================================================================
Function foundEnf(id_pere As Long, id_mere As Long) As Variant
   
   ' Création de la command
   Dim cmd As New ADODB.Command
   Set cmd.CommandText = "SELECT *" & _
                         "FROM Personnes" & _
                         "WHERE ID_Pere = " & CStr(id_pere) & _
                               "ID_Mere = " & CStr(id_mere)
                               
   ' Execution de la command
   Dim rst As New ADODB.Recordset
   Set rst = cmd.Execute
   
End Function


'------------------------------------------------------------------------------
' Connection à la base access Familles.mdb
'==============================================================================
Sub connecter()

   con.Open STRCON, "admin", ""
   
End Sub

'------------------------------------------------------------------------------
' déconnection de la base access Familles.mdb
'==============================================================================
Sub deconnecter()

   con.Close
   Set con = Nothing
   
End Sub


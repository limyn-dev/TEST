Attribute VB_Name = "mdlDB"

' Ouverture d'une table
'------------------------------------------------------------------------------
Public Sub rstOpen(ByRef con As ADODB.Connection, ByVal nomTbl As String, ByRef rst As ADODB.Recordset)
    If rst Is Nothing Then
        Set rst = New ADODB.Recordset
    ElseIf rst.State = adStateOpen Then
        rst.Close
    End If
    rst.Open nomTbl, con, adOpenKeyset, adLockOptimistic, -1
End Sub

' Fermeture d'une table
'------------------------------------------------------------------------------
Public Sub rstClose(ByRef rst As ADODB.Recordset)
    If rst.State = adStateOpen Then rst.Close
    Set rst = Nothing
End Sub

' Positionnement du pointeur dans un recordset en fonction de la position dans le recordset
'------------------------------------------------------------------------------
Public Sub rstMove(ByRef rst As ADODB.Recordset, ByVal index As Integer)
    If Not rst Is Nothing Then
        If rst.State = adStateOpen Then
            rst.Move CLng(index)
        End If
    End If
End Sub

' Positionnement du pointeur dans un recordset en fonction de la valeur d'un champ
'------------------------------------------------------------------------------
Public Sub rstFind(ByRef rst As ADODB.Recordset, ByVal fldNom As String, ByVal fldVal As String)
    If Not rst Is Nothing Then
        If rst.State = adStateOpen Then
            If Not rst.BOF Then rst.MoveFirst
            rst.Find fldNom & "=" & fldVal
        End If
    End If
End Sub

' Execute une commande qui a un id en paramètre
'------------------------------------------------------------------------------
Private Function ReadById(ByVal nomCmd As String, ByVal id As Long) As ADODB.Recordset
    Set ReadById = New ADODB.Recordset
    If imSet Then
        Dim cat As New ADOX.Catalog
        cat.ActiveConnection = myCon
        With cat.Procedures.Item(nomCmd).Command
            .Parameters.Item("[idParam]").Value = id
            Set ReadById = Nothing
            Set ReadById = .Execute
        End With
    End If
End Function

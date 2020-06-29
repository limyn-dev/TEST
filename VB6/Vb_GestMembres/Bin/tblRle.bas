Attribute VB_Name = "tblRle"
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private myRst As New ADODB.Recordset

' Recherche
'------------------------------------------------------------------------------
Public Function ReadByMbrId(ByVal mbrId As Long) As CMembre
End Function

' Ajout
'------------------------------------------------------------------------------
Public Sub Insert()
End Sub

' Modification
'------------------------------------------------------------------------------
Public Sub Modify()
End Sub

' Ouverture de la table
'------------------------------------------------------------------------------
Public Sub TblOpen(con As ADODB.Connection, nomTbl As String)
    mdlDB.TblOpen con, nomTbl, myRst
End Sub

' Fermeture de la table
'------------------------------------------------------------------------------
Public Sub TblClose()
    mdlDB.TblClose myRst
End Sub




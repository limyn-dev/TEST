Attribute VB_Name = "tblLoc"
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private myRst As New ADODB.Recordset

' Liste de toutes les localit�s
'------------------------------------------------------------------------------
Public Function SelectAll() As CLocalites

End Function

' S�lection d'une localit� en fonction de son id
'------------------------------------------------------------------------------
Public Function SelectById(id As Integer) As CLocalite

End Function

' Mise � jour d'une localit�
'------------------------------------------------------------------------------
Public Sub UpDate(localite As CLocalite)

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

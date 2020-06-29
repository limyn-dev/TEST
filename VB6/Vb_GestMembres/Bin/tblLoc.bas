Attribute VB_Name = "tblLoc"
Option Explicit

' Membres
'------------------------------------------------------------------------------
Private myRst As New ADODB.Recordset

' Liste de toutes les localités
'------------------------------------------------------------------------------
Public Function SelectAll() As CLocalites

End Function

' Sélection d'une localité en fonction de son id
'------------------------------------------------------------------------------
Public Function SelectById(id As Integer) As CLocalite

End Function

' Mise à jour d'une localité
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

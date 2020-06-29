Attribute VB_Name = "tblFam"
Option Explicit

' Structure de la table des famille
'------------------------------------------------------------------------------
Private Const FLD_ID = 1

' Membres
'------------------------------------------------------------------------------
Private myRst As New ADODB.Recordset

' Recherche d'une famille par son id
'------------------------------------------------------------------------------
Public Function ReadByFamId(ByVal famId As Long) As CFamille
    Set ReadById = New CFamille
    mdlDB.rstFind myRst, FLD_ID, CStr(famId)
    If Not myRst.EOF Then
        With ReadById
            .id = myRst!famId
            .Nom = myRst!famNom
            .Adresse = myRst!famAdresse
            .Membres
        End With
    Else
End Function

' Ajout d'une nouvelle famille
'------------------------------------------------------------------------------
Public Sub Insert(Nom As String, prenom As String, Adresse As String, Tel As String)
    Dim id As Integer

    id = nextId
    myRst.AddNew
    myRst!cltId = id
    myRst!cltNom = Nom
    myRst!cltPrenom = prenom
    myRst!cltAdresse = Adresse
    myRst!cltTel = Tel
    myRst.UpDate
    myRst.MoveLast
    If myRst.Fields("cltId").Value = id Then
        Insert = True
    Else
        Insert = False
    End If
End Sub

' Modification d'une famille
'------------------------------------------------------------------------------
Public Sub Modify(id As Long, Nom As String, prenom As String, Adresse As String, Tel As String)
  
    If fndRecord(id) Then
        myRst!cltNom = Nom
        myRst!cltPrenom = prenom
        myRst!cltAdresse = Adresse
        myRst!cltTel = Tel
        myRst.UpDate
        Modify = True
    Else
        Modify = False
    End If
    
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








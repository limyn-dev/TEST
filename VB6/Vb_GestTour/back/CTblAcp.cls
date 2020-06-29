VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblAcp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des accompagnateurs"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DBFDB0064"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'Gestion de la table des accompagnateurs
Option Explicit

'##ModelId=399EF31A0302
Private myCon As Connection
'##ModelId=399EF33C033E
Private myNomTbl As String
'##ModelId=399EF34C0096
Private myRst As Recordset
'##ModelId=399EF36D0370
Private imSet As Boolean

' Initialisation des membres
'------------------------------------------------------------------------------
Public Function Initialize(con As ADODB.Connection, myNomTbl As String) As Boolean
    If Not imSet Then
        Set myCon = con
        myNomTbl = nomTbl
        myRst.Open myNomTbl, myCon, adOpenKeyset, adLockOptimistic, -1
        imSet = True
    End If
End Function

' Recherche d'un accompagnant par son id
'------------------------------------------------------------------------------
'##ModelId=399DC0750154
Public Function ReadByAcpId(acpId As Long) As CAccompagnateur
    If fndRecord(acpId) Then
        Set ReadByAcpId = New CAccompagnateur
        With ReadByAcpId
            .id = myRst!acpId
            .nom = myRst!acpNom
            .prenom = myRst!acpPrenom
            .adresse = myRst!acpAdresse
            .tel = myRst!acpTel
        End With
    Else
        Set ReadByAcpId = Nothing
    End If
End Function

'Ajout d'un accompagnateur dans la table
'------------------------------------------------------------------------------
'##ModelId=399DC0870014
Public Function Insert(nom As String, prenom As String, adresse As String, tel As String) As Boolean
Attribute Insert.VB_Description = "Ajout d'un accompagnateur dans la table"
    Dim id As Integer

    id = nextId
    myRst.AddNew
    myRst!acpId = id
    myRst!acpNom = nom
    myRst!acpPrenom = prenom
    myRst!acpAdresse = adresse
    myRst!acpTel = tel
    myRst.Update
    myRst.MoveLast
    If myRst.Fields("acpId").Value = id Then
        Insert = True
    Else
        Insert = False
    End If
    
End Function

'Modification d'un accompagnateur
'------------------------------------------------------------------------------
'##ModelId=399DC08C0316
Public Function Modify(id As Long, nom As String, prenom As String, adresse As String, tel As String) As Boolean
Attribute Modify.VB_Description = "Modification d'un accompagnateur"
    
    If fndRecord(id) Then
        myRst!acpNom = nom
        myRst!acpPrenom = prenom
        myRst!acpAdresse = adresse
        myRst!acpTel = tel
        myRst.Update
        Modify = True
    Else
        Modify = False
    End If
    
End Function

' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DC1840230
Private Sub Class_Initialize()
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Fin de la classe
'------------------------------------------------------------------------------
'##ModelId=399DC1830384
Private Sub Class_Terminate()
    Set myRst = Nothing
End Sub

' Position du rst
'------------------------------------------------------------------------------
Private Function fndRecord(id As Long) As Boolean
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
        myRst.Find "acpId=" & CStr(id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
Private Function nextId() As Long
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("acpId").Value
        nextId = nextId + 1
    End If
End Function


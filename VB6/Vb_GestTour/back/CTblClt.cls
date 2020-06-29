VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblClt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des clients"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399D996401B8"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'Gestion de la table des clients
Option Explicit

Private myCon As ADODB.Connection
Private myNomTbl As String
Private myRst As ADODB.Recordset
Private imSet As Boolean

' Initialisation des membres
'------------------------------------------------------------------------------
Public Function Initialize() As Boolean
    If Not imSet Then
        Set myCon = con
        myNomTbl = nomTbl
        myRst.Open myNomTbl, myCon, adOpenKeyset, adLockOptimistic, -1
        imSet = True
    End If
End Function

'Recherche d'un client par son id
'------------------------------------------------------------------------------
'##ModelId=399D996C03C0
Public Function ReadByCltId(ByVal cltId As Long) As CClient
Attribute ReadByCltId.VB_Description = "Recherche d'un client par son id"
    If fndRecord(cltId) Then
        Set ReadByAcpId = New CClient
        With ReadByAcpId
            .id = myRst!cltId
            .nom = myRst!cltNom
            .prenom = myRst!cltPrenom
            .adresse = myRst!cltAdresse
            .tel = myRst!acpTel
        End With
    Else
        Set ReadByAcpId = Nothing
    End If
End Function

' Ajout d'un nouveau client dans la table
'------------------------------------------------------------------------------
'##ModelId=399D997502B2
Public Sub Insert(nom As String, prenom As String, adresse As String, tel As String)
    Dim id As Integer

    id = nextId
    myRst.AddNew
    myRst!cltId = id
    myRst!cltNom = nom
    myRst!cltPrenom = prenom
    myRst!cltAdresse = adresse
    myRst!cltTel = tel
    myRst.Update
    myRst.MoveLast
    If myRst.Fields("cltId").Value = id Then
        Insert = True
    Else
        Insert = False
    End If
End Sub

' Modification d'un client existant
'------------------------------------------------------------------------------
'##ModelId=399DC68E0172
Public Sub Modify(id As Long, nom As String, prenom As String, adresse As String, tel As String)
  
    If fndRecord(id) Then
        myRst!cltNom = nom
        myRst!cltPrenom = prenom
        myRst!cltAdresse = adresse
        myRst!cltTel = tel
        myRst.Update
        Modify = True
    Else
        Modify = False
    End If
    
End Sub

' Instanciation de la classe
'------------------------------------------------------------------------------
'##ModelId=399D9A4B012C
Private Sub Class_Initialize()
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation de la classe
'------------------------------------------------------------------------------
'##ModelId=399D9A4B0352
Private Sub Class_Terminate()
    Set myRst = Nothing
End Sub

' Position du rst
'------------------------------------------------------------------------------
Private Function fndRecord(id As Long) As Boolean
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
        myRst.Find "cltId=" & CStr(id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
Private Function nextId() As Long
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("cltId").Value
        nextId = nextId + 1
    End If
End Function



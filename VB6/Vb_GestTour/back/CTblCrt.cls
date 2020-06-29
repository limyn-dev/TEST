VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblCrt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des circuits"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DAB4E00AA"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'Gestion de la table des circuits
Option Explicit

Private myCon As ADODB.Connection
Private myNomTbl As String
Private myRst As ADODB.Recordset
Private imSet As Boolean
Private myTblAcp As CTblAcp
Private myTblEtp As CTblEtp
Private myTasPti As CTasPti

' Initialisation des membres
'------------------------------------------------------------------------------
Public Function Initialize(con As ADODB.Connection, nomTbl As String, tblAcp As CTblAcp, tblEtp As CTblEtp, tblPti As CTasPti) As Boolean
    If Not imSet Then
        Set myCon = con
        myNomTbl = nomTbl
        myRst.Open myNomTbl, myCon, adOpenKeyset, adLockOptimistic, -1
        imSet = True
        Set myTblAcp = tblAcp
    End If
End Function

'Recherche d'un circuit par son id
'------------------------------------------------------------------------------
'##ModelId=399DAB6303D4
Public Function ReadByCrtId(crtId As Long) As CCircuit
Attribute ReadByCrtId.VB_Description = "Recherche d'un circuit par son id"
    
    If fndRecord(crtId) Then
        Set ReadByCrtId = New CClient
        With ReadByAcpId
            .Id = myRst!cltId
            .Intitule = myRst!cltNom
            .Prix = myRst!cltPrenom
            .NombrePlace = myRst!cltAdresse
            .Participants = myTasPti.ClientsByCircuits(myRst!crtId)
            .Etapes = myTblEtp.EtapesByCircuits(myRst!crtId)
        End With
    Else
        Set ReadByCrtId = Nothing
    End If
End Function

'
'------------------------------------------------------------------------------
'##ModelId=399DAB6B0078
Public Sub Insert(Intitule As String, Prix As Integer, NombrePlace As Integer, acpId As Long)

End Sub

'
'------------------------------------------------------------------------------
'##ModelId=399DB735003C
Public Sub Modify(Id As Long, Intitule As String, Prix As Integer, NombrePlace As Integer)

End Sub

'
'------------------------------------------------------------------------------
'##ModelId=399DABE003DE
Private Sub Class_Terminate()

End Sub

'
'------------------------------------------------------------------------------
'##ModelId=399DABE101AE
Private Sub Class_Initialize()

End Sub

' Position du rst
'------------------------------------------------------------------------------
Private Function fndRecord(Id As Long) As Boolean
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
        myRst.Find "crtId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
Private Function nextId() As Long
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("crtId").Value
        nextId = nextId + 1
    End If
End Function



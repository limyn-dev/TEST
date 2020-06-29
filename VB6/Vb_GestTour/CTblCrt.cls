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
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des circuits
Option Explicit

'##ModelId=39A39A1C02DB
Private my_Con As ADODB.Connection
'##ModelId=39A39A1C0316
Private myNomTbl As String
'##ModelId=39A39A1D000B
Private myRst As ADODB.Recordset
'##ModelId=39A39A1D003C
Private imSet As Boolean
'##ModelId=39A39A1D00AB
Private my_TblAcp As CTblAcp
'##ModelId=39A39A1D014B
Private my_TblEtp As CTblEtp
'##ModelId=39A39A1D01B9
Private my_TblPti As CTblPti

' Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=39A39A1D0226
Public Function Initialize(con As ADODB.Connection, nomTbl As String, tblAcp As CTblAcp, tblEtp As CTblEtp, tblPti As CTblPti) As Boolean
Attribute Initialize.VB_Description = " Initialisation des membres\r\n------------------------------------------------------------------------------"
    Initialize = False
    If Not imSet Then
        Set my_Con = con
        myNomTbl = nomTbl
        myRst.Open myNomTbl, my_Con, adOpenKeyset, adLockOptimistic, -1
        Set my_TblAcp = tblAcp
        Set my_TblEtp = tblEtp
        Set my_TblPti = tblPti
        imSet = True
        Initialize = True
    End If
End Function

' Recherche de tous les circuit
'------------------------------------------------------------------------------
'##ModelId=39A39A1D033E
Public Function ReadAll() As CCircuits
Attribute ReadAll.VB_Description = " Recherche de tous les circuit\r\n------------------------------------------------------------------------------"
    If imSet Then
        Set ReadAll = New CCircuits
        If Not myRst.BOF Then myRst.MoveFirst
        While Not myRst.EOF
            ReadAll.Add loadRecord
            myRst.MoveNext
        Wend
    End If
End Function

' Recherche d'un circuit par son id
'------------------------------------------------------------------------------
'##ModelId=399DAB6303D4
Public Function ReadByCrtId(crtId As Long) As CCircuit
Attribute ReadByCrtId.VB_Description = "Recherche d'un circuit par son id\r\n------------------------------------------------------------------------------"
    If imSet And fndRecord(crtId) Then
        Set ReadByCrtId = loadRecord
    Else
        Set ReadByCrtId = New CCircuit
    End If
End Function

' Liste des circuits éffectuer par un client
'------------------------------------------------------------------------------
'##ModelId=39A6E4840384
Public Function ReadByCltId(cltId As Long) As CCircuits
Attribute ReadByCltId.VB_Description = " Liste des circuits éffectuer par un client\r\n------------------------------------------------------------------------------"
    Set ReadByCltId = New CCircuits
    Dim rqt As ADODB.Recordset
    Set rqt = ReadById("rqtcrtIdBycltId", cltId)
    If Not rqt.BOF Then rqt.MoveFirst
    While Not rqt.EOF
        ReadByCltId.Add my_TblCrt.ReadByCrtId(rqt!crtId)
        rqt.MoveNext
    Wend
    Set rqt = Nothing
End Function

' Enregistrement d'un circuit
'------------------------------------------------------------------------------
'##ModelId=399DAB6B0078
Public Function WriteRecord(circuit As CCircuit) As Boolean
Attribute WriteRecord.VB_Description = "\r\n------------------------------------------------------------------------------"
    Dim etp As CEtape
    Dim pti As CParticipant
    If imSet Then
        WriteRecord = True
        With circuit
            If Not fndRecord(.Id) Then
                .Id = nextId
                myRst.AddNew
            End If
            myRst!crtId = .Id
            myRst!crtIntitule = .Intitule
            myRst!crtNombrePlace = .NombrePlace
            myRst!crtPrix = .Prix
            myRst!acpId = .accompagnateur.Id
            myRst.Update
            If Not fndRecord(.Id) Then
                WriteRecord = False
            Else
                For Each etp In .Etapes
                    tblEtp.WriteRecord .Id, etp
                Next
                For Each pti In .Participants
                    tblPti.WriteRecord .Id, pti
                Next
            End If
        End With
    End If
End Function



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DABE101AE
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DABE003DE
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

' Position du rst
'------------------------------------------------------------------------------
'##ModelId=39A39A1E02C6
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = " Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        If Not myRst.BOF Then myRst.MoveFirst
        myRst.Find "crtId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=39A39A1E0334
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("crtId").Value
        nextId = nextId + 1
    End If
End Function

' Création d'un circuit depuis la position courante du rst
'------------------------------------------------------------------------------
'##ModelId=39A39A1E0366
Private Function loadRecord() As CCircuit
Attribute loadRecord.VB_Description = " Création d'un circuit depuis la position courante du rst\r\n------------------------------------------------------------------------------"
    Set loadRecord = New CCircuit
    With loadRecord
        If Not myRst.EOF Then
            .Id = myRst!crtId
            .Intitule = myRst!crtIntitule
            .NombrePlace = myRst!crtNombrePlace
            .Prix = myRst!crtPrix
            Set .accompagnateur = my_TblAcp.ReadByAcpId(myRst!acpId)
            Set .Etapes = my_TblEtp.ReadByCrtId(myRst!crtId)
            Set .Participants = my_TblPti.ReadByCrtId(myRst!crtId)
        End If
    End With
End Function



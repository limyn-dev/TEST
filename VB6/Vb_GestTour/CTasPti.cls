VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblPti"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des participants à un circuit"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DB4BA02D0"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des participants à un circuit
Option Explicit



'##ModelId=399EB25502F8
Private my_Con As Connection
'##ModelId=399EF1EE00DC
Private myNomTbl As String
'##ModelId=399EF211032A
Private myRst As Recordset
'##ModelId=399EF2630366
Private imSet As Boolean
'##ModelId=39A39A2E0321
Private my_TblCrt As CTblCrt
'##ModelId=39A39A2E03CB
Private my_TblClt As CTblClt



' Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=399EF146024E
Public Function Initialize(con As Connection, nomTbl As String, tblCrt As CTblCrt, tblClt As CTblClt)
Attribute Initialize.VB_Description = " Initialisation des membres\r\n------------------------------------------------------------------------------"
    Initialize = False
    If Not imSet Then
        Set my_Con = con
        myNomTbl = nomTbl
        Set my_TblCrt = tblCrt
        Set my_TblClt = tblClt
        myRst.Open myNomTbl, con, adOpenKeyset, adLockOptimistic, -1
        imSet = True
        Initialize = True
    End If
End Function

' Recherche d'un participant par son id
'------------------------------------------------------------------------------
'##ModelId=39A6E49202A8
Public Function ReadByPtiId(ptiId As Long) As CParticipant
Attribute ReadByPtiId.VB_Description = " Recherche d'un participant par son id\r\n------------------------------------------------------------------------------"
    Set ReadByPtiId = New CParticipant
    With ReadByPtiId
        If imSet And fndRecord(ptiId) Then
            .Id = myRst!ptiId
            .Accompte = myRst!ptiAccompte
            .Versement = myRst!ptiVersement
            .Remise = myRst!ptiremise
            Set .Client = my_TblClt.ReadByCltId(myRst!cltId)
        End If
    End With
End Function

' Liste des client pour un circuit donné
'------------------------------------------------------------------------------
'##ModelId=39A39A2F015E
Public Function ReadByCrtId(crtId As Long) As CParticipants
    Set ReadByCrtId = New CParticipants
    Dim rqt As ADODB.Recordset
    Set rqt = ReadById("rqtPtiIdByCrtId", crtId)
    If Not rqt.BOF Then rqt.MoveFirst
    While Not rqt.EOF
        ReadByCrtId.Add ReadByPtiId(rqt!ptiId)
        rqt.MoveNext
    Wend
    rqt.Close
    Set rqt = Nothing
End Function

' Ajout d'un client dans un circuit
'------------------------------------------------------------------------------
'##ModelId=399DB5700136
Public Function WriteRecord(crtId As Long, participant As CParticipant) As Boolean
Attribute WriteRecord.VB_Description = " Ajout d'un client dans un circuit\r\n------------------------------------------------------------------------------"
    WriteRecord = True
    If imSet Then
        With participant
            .Id = fndExist(crtId, .Client.Id)
            If Not .Id > 0 Then
                .Id = nextId
                myRst.AddNew
            End If
            myRst!ptiId = .Id
            myRst!crtId = crtId
            myRst!cltId = .Client.Id
            myRst!ptiAccompte = .Accompte
            myRst!ptiVersement = .Versement
            myRst!ptiremise = .Remise
            myRst.Update
            If Not fndRecord(.Id) Then
                WriteRecord = False
            Else
                my_TblClt.WriteRecord .Client
            End If
        End With
    End If
End Function

' Suppression d'un client dans un circuit
'------------------------------------------------------------------------------
'##ModelId=399DB5AD0334
Public Sub Remove(crtId As Long, cltId As Long)
Attribute Remove.VB_Description = " Suppression d'un client dans un circuit\r\n------------------------------------------------------------------------------"
    Remove = False
    If fndRecord(crtId, cltId) Then
        myRst.Delete
        myRst.UpdateBatch
        If Not fndRecord(crtId, cltId) Then Remove = True
    End If
End Sub



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DBF370398
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DBF3801D6
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=39A39A3000AA
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        If Not myRst.BOF Then myRst.MoveFirst
        myRst.Find "ptiId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Contrôle si le client est déja enregistré sur le tour
'------------------------------------------------------------------------------
'##ModelId=39A6E49301FE
Private Function fndExist(crtId As Long, cltId As Long) As Long
Attribute fndExist.VB_Description = " Contrôle si le client est déja enregistré sur le tour\r\n------------------------------------------------------------------------------"
    Dim cmd As New ADODB.Command
    Dim rqt As New ADODB.Recordset
    fndExist = 0
    If imSet Then
        With cmd
            .ActiveConnection = my_Con
            .CommandText = "SELECT * " & _
                           "FROM tblParticipants " & _
                           "WHERE crtId=" & CStr(crtId) & " AND " & "cltId=" & CStr(cltId)
        End With
        With rqt
            .CursorLocation = adUseClient
            .Open cmd, , adOpenStatic, adLockBatchOptimistic
            If rqt.RecordCount > 0 Then fndExist = rqt!ptiId
        End With
    End If
    rqt.Close
    Set rqt = Nothing
    Set cmd = Nothing
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=39A6E49302DA
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("ptiId").Value
        nextId = nextId + 1
    End If
End Function

' Execute une commande qui a un id en paramètre
'------------------------------------------------------------------------------
'##ModelId=39A39A300118
Private Function ReadById(nomCmd As String, Id As Long) As ADODB.Recordset
Attribute ReadById.VB_Description = " Execute une commande qui a un id en paramètre\r\n------------------------------------------------------------------------------"
    Set ReadById = New ADODB.Recordset
    If imSet Then
        Dim cat As New ADOX.Catalog
        cat.ActiveConnection = my_Con
        With cat.Procedures.Item(nomCmd).Command
            .Parameters.Item("[idParam]").Value = Id
            Set ReadById = Nothing
            Set ReadById = .Execute
        End With
    End If
End Function



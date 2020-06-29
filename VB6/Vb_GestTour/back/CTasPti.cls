VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTasPti"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des participants à un circuit"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DB4BA02D0"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'Gestion de la table des participants à un circuit
Option Explicit

'##ModelId=399EB25502F8
Private myCon As Connection
'##ModelId=399EF1EE00DC
Private myNomTbl As String
'##ModelId=399EF211032A
Private myRst As Recordset
'##ModelId=399EF2630366
Private imSet As Boolean
Private myTblCrt As CTblCrt
Private myTblClt As CTblClt

' Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=399EF146024E
Public Sub Initialize(con As Connection, nomTblPti As String, tblCrt As CTblCrt, tblClt As CTblClt)
    If Not imSet Then
        Set myCon = con
        myNomTbl = nomTblEtp
        myTblCrt = tblCrt
        myTblClt = tblClt
        rstRef.Open myNomTbl, con, adOpenKeyset, adLockOptimistic, -1
        imSet = True
    End If
End Sub

' Liste des client pour un circuit donné
'------------------------------------------------------------------------------
Public Function ClientsByCircuits(crtId As Long) As CClients
    Dim rqt As ADODB.Recordset
    
    ' Recherche des id des client
    Set rqt = ReadById("rqtCltIdByCrtId", crtId)
    
    ' Création de la collection des étapes en fonction des id
    If Not rqt = Nothing Then
        Set ClientsByCircuits = New CClients
        rqt.MoveFirst
        While Not rqt.EOF
            ClientsByCircuits.Add myTblClt.ReadByCltId(rqt!cltId)
            rqt.MoveNext
        Wend
    Else
        Set ClientsByCircuits = Nothing
    End If
        
    Set rqt = Nothing
End Function

' Liste des circuits éffectuer par un client
'------------------------------------------------------------------------------
Public Function CircuitsByClients(cltId As Long) As CCircuits
    Dim rqt As ADODB.Recordset
    
    ' Recherche des id des étapes où l'organisme a participer
    Set rqt = ReadById("rqtcrtIdBycltId", cltId)
    
    ' Création de la collection des étapes en fonction des id
    If Not rqt = Nothing Then
        Set ReadByOrgId = New CCircuits
        rqt.MoveFirst
        While Not rqt.EOF
            ReadByOrgId.Add myTblCrt.ReadByCrtId(rqt!crtId)
            rqt.MoveNext
        Wend
    Else
        Set ReadByOrgId = Nothing
    End If
        
    Set rqt = Nothing
End Function

' Ajout d'un client dans un circuit
'------------------------------------------------------------------------------
'##ModelId=399DB5700136
Public Sub Insert(crtId As Long, cltId As Long, Accompte As Integer, Versement As Integer, Remise As Integer)
    Insert = False
    If imSet Then
        If Not fndRecord(crtId, cltId) Then
            myRst.AddNew
            myRst!crtId = crtId
            myRst!cltId = cltId
            myRst!ptiAccompte = Accompte
            myRst!ptiVersement = Versement
            myRst!Remise = Remise
            myRst.Update
            If fndRecord(crtId, cltId) Then Insert = True
        End If
    End If
End Sub

' Suppression d'un client dans un circuit
'------------------------------------------------------------------------------
'##ModelId=399DB5AD0334
Public Sub Remove(crtId As Long, cltId As Long)
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

End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DBF3801D6
Private Sub Class_Terminate()

End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=399EEED0032A
Private Function fndRecord(crtId As Long, cltId As Long) As Boolean
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
        myRst.Find "crtId=" & CStr(crtId) & " AND " & "cltId=" & CStr(cltId)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Execute une commande qui a un id en paramètre
'------------------------------------------------------------------------------
Private Function ReadById(nomCmd As String, Id As Long) As ADODB.Recordset
    If imSet Then
        Dim cat As New ADOX.Catalog
        cat.ActiveConnection = myCon
        With cat.Procedures.Item(nomCmd).Command
            .Parameters.Item("[idParam]").Value = Id
            Set ReadById = .Execute
        End With
    Else
        Set ReadById = Nothing
    End If
End Function


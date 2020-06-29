VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTasCtc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des contactes (organisme actif dans les étapes de circuits)"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DAC4F0294"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'Gestion de la table des contactes (organisme actif dans les étapes de circuits)
Option Explicit

' Membres
Private myCon As ADODB.Connection
Private myNomTbl As String
Private myRst As ADODB.Recordset
Private imSet As Boolean
Private myTblEtp As CTblEtp
Private mytblOrg As CTblOrg

' Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=399EF7AB02EE
Public Sub Initialize(con As ADODB.Connection, nomTblCtc As String, tblEtp As CTblEtp, tblOrg As CTblOrg)
    
    Initialize = False
    If Not imSet Then
        myCon = con
        myNomTbl = nomTblCtc
        rstRef.Open myNomTbl, con, adOpenKeyset, adLockOptimistic, -1
        myTblEtp = tblEtp
        mytblOrg = tblOrg
        imSet = True
        Initialize = True
    End If
    
End Sub

'Recherche de la liste des organismes actif à une étape d'un circuit
'------------------------------------------------------------------------------
'##ModelId=399DADE70140
Public Function OrganismeByEtape(etpId As Long) As COrganismes
    Dim rqt As ADODB.Recordset
    
    ' Recherche des id des organismes actifs pour l'étape
    Set rqt = ReadById("rqtOrgIdByEtpId", etpId)
    
    ' Création de la collection des étapes en fonction des id
    If Not rqt = Nothing Then
        Set ReadByEtpId = New COrganismes
        rqt.MoveFirst
        While Not rqt.EOF
            ReadByEtpId.Add mytblOrg.ReadByOrgId(rqt!orgId)
            rqt.MoveNext
        Wend
    Else
        Set ReadByEtpId = Nothing
    End If
        
    Set rqt = Nothing
End Function

'Recherche de la liste des étapes de circuits pour un organisme donné
'------------------------------------------------------------------------------
'##ModelId=399DB7F8028A
Public Function EtapesByOrganisme(orgId As Long) As CEtapes
    Dim rqt As ADODB.Recordset
    
    ' Recherche des id des étapes où l'organisme a participer
    Set rqt = ReadById("rqtEtpIdByOrgId", orgId)
    
    ' Création de la collection des étapes en fonction des id
    If Not rqt = Nothing Then
        Set ReadByOrgId = New CEtapes
        rqt.MoveFirst
        While Not rqt.EOF
            ReadByOrgId.Add myTblEtp.ReadByEtpId(rqt!etpId)
            rqt.MoveNext
        Wend
    Else
        Set ReadByOrgId = Nothing
    End If
        
    Set rqt = Nothing
End Function

'Ajout de l'intérventiion d'un organisme dans un circuit.
'------------------------------------------------------------------------------
'##ModelId=399DB8B500D2
Public Function Insert(etpId As Long, orgId As Long) As Boolean
Attribute Insert.VB_Description = "Ajout de l'intérventiion d'un organisme dans un circuit."
    Insert = False
    If imSet Then
        If Not fndRecord(etpId, orgId) Then
            myRst.AddNew
            myRst!etpId = etpId
            myRst!orgId = orgId
            myRst.Update
            If fndRecord(etpId, orgId) Then Insert = True
        End If
    End If
End Function

'Suppression de l'intérvention d'un organisme dans  le passage d'un circuit.
'------------------------------------------------------------------------------
'##ModelId=399DB92E0398
Public Function Remove(etpId As Long, orgId As Long) As Boolean
Attribute Remove.VB_Description = "Suppression de l'intérvention d'un organisme dans  le passage d'un circuit."
    Remove = False
    If fndRecord(etpId, orgId) Then
        myRst.Delete
        myRst.UpdateBatch
        If Not fndRecord(etpId, orgId) Then Remove = True
    End If
End Function

'------------------------------------------------------------------------------
'##ModelId=399DBF67017C
Private Sub Class_Initialize()
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

'------------------------------------------------------------------------------
'##ModelId=399DBF6602D0
Private Sub Class_Terminate()
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=399EEED0032A
Private Function fndRecord(etpId As Long, orgId As Long) As Boolean
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
        myRst.Find "etpId=" & CStr(Id) & " AND " & "orgId=" & CStr(orgId)
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




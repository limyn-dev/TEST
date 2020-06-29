VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblCtc"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des contactes (organisme actif dans les étapes de circuits)"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DAC4F0294"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des contactes (organisme actif dans les étapes de circuits)
Option Explicit



' Membres
'##ModelId=39A39A2A00F1
Private my_Con As ADODB.Connection
Attribute my_Con.VB_VarDescription = " Membres"
'##ModelId=39A39A2A015E
Private myNomTbl As String
'##ModelId=39A39A2A023B
Private myRst As ADODB.Recordset
'##ModelId=39A39A2A0276
Private imSet As Boolean
'##ModelId=39A39A2A02E5
Private my_TblEtp As CTblEtp
'##ModelId=39A39A2A0385
Private my_TblOrg As CTblOrg



' Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=399EF7AB02EE
Public Function Initialize(con As ADODB.Connection, nomTbl As String, tblEtp As CTblEtp, tblOrg As CTblOrg) As Boolean
Attribute Initialize.VB_Description = " Initialisation des membres\r\n------------------------------------------------------------------------------"
    Initialize = False
    If Not imSet Then
        Set my_Con = con
        myNomTbl = nomTbl
        myRst.Open myNomTbl, con, adOpenKeyset, adLockOptimistic, -1
        Set my_TblEtp = tblEtp
        Set my_TblOrg = tblOrg
        imSet = True
        Initialize = True
    End If
End Function

'Recherche de la liste des organismes actif à une étape d'un circuit
'------------------------------------------------------------------------------
'##ModelId=39A39A2B00B5
Public Function ReadByEtpId(etpId As Long) As COrganismes
Attribute ReadByEtpId.VB_Description = "Recherche de la liste des organismes actif à une étape d'un circuit\r\n------------------------------------------------------------------------------"
    Set OrganismesByetpId = New COrganismes
    Dim rqt As ADODB.Recordset
    Set rqt = OrganismesByetpId("rqtOrgIdByEtpId", etpId)
    If Not rqt.BOF Then rqt.MoveFirst
    While Not rqt.EOF
        OrganismesByetpId.Add my_TblOrg.ReadByOrgId(rqt!orgId)
        rqt.MoveNext
    Wend
    Set rqt = Nothing
End Function

'Recherche de la liste des étapes de circuits pour un organisme donné
'------------------------------------------------------------------------------
'##ModelId=39A39A2B0122
Public Function ReadByOrgId(orgId As Long) As CEtapes
Attribute ReadByOrgId.VB_Description = "Recherche de la liste des étapes de circuits pour un organisme donné\r\n------------------------------------------------------------------------------"
    Set EtapesByorgId = New CEtapes
    Dim rqt As ADODB.Recordset
    Set rqt = ReadById("rqtEtpIdByOrgId", orgId)
    If Not rqt.BOF Then rqt.MoveFirst
    While Not rqt.EOF
        EtapesByorgId.Add my_TblEtp.ReadByEtpId(rqt!etpId)
        rqt.MoveNext
    Wend
    Set rqt = Nothing
End Function

'Ajout de l'intérventiion d'un organisme dans un circuit.
'------------------------------------------------------------------------------
'##ModelId=399DB8B500D2
Public Function WriteRecord(etape As CEtape) As Boolean
Attribute WriteRecord.VB_Description = "Ajout de l'intérventiion d'un organisme dans un circuit.\r\n------------------------------------------------------------------------------"
    Dim org As COrganisme
    Dim ctcId As Long
    
    WriteRecord = True
    With etape
        For Each org In .Contacts
            If fndRecord(.Id, org.Id) Then
                ctcId = myRst!ctcId
            Else
                ctcId = nextId
                myRst.AddNew
            End If
            myRst!ctcId = ctcId
            myRst!etpId = .Id
            myRst!orgId = org.Id
            myRst.Update
            If Not fndRecord(.Id, org.Id) Then WriteRecord = False
        Next
    End With
    
End Function

'Suppression de l'intérvention d'un organisme dans  le passage d'un circuit.
'------------------------------------------------------------------------------
'##ModelId=399DB92E0398
Public Function Remove(etpId As Long, orgId As Long) As Boolean
Attribute Remove.VB_Description = "Suppression de l'intérvention d'un organisme dans  le passage d'un circuit.\r\n------------------------------------------------------------------------------"
    Remove = False
    If fndRecord(etpId, orgId) Then
        myRst.Delete
        myRst.UpdateBatch
        If Not fndRecord(etpId, orgId) Then Remove = True
    End If
End Function



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DBF67017C
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DBF6602D0
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=39A39A2B037A
Private Function fndRecord(etpId As Long, orgId As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n------------------------------------------------------------------------------"
    Dim cmd As New ADODB.Command
    Dim rqt As New ADODB.Recordset
    fndRecord = True
    If imSet Then
        With cmd
            .ActiveConnection = my_Con
            .CommandText = "SELECT * " & _
                           "FROM tblContacts " & _
                           "WHERE etpId=" & CStr(etpId) & " AND " & "orgId=" & CStr(orgId)
        End With
        With rqt
            .CursorLocation = adUseClient
            .Open cmd, , adOpenStatic, adLockBatchOptimistic
            If rqt.RecordCount > 0 Then
                myRst.Find "ctcId=" & CStr(rqt!ctcId)
            Else
                fndRecord = False
            End If
        End With
    End If
    rqt.Close
    Set rqt = Nothing
    Set cmd = Nothing
End Function

' Execute une commande qui a un id en paramètre
'------------------------------------------------------------------------------
'##ModelId=39A39A2C0000
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

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=39A6E490010E
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        If Not myRst.EOF Then myRst.MoveLast
        nextId = myRst!ctcId
        nextId = nextId + 1
    End If
End Function




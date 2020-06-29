VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblOrg"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des organismes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DA9690122"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des organismes
Option Explicit



' Membre
'##ModelId=399EEECF01B9
Private my_Con As ADODB.Connection   ' Référance sur la connexion sur la db
Attribute my_Con.VB_VarDescription = " Membre"
'##ModelId=399EEECF0259
Private myRst As ADODB.Recordset    ' Recordset sur la table des organismes
'##ModelId=399EEECF0294
Private myNomTbl As String          ' Nom de la table des organismes
'##ModelId=399EEECF0302
Private imSet As Boolean            ' Flag de validité de la classe
'##ModelId=39A39A180187
Private my_TblTpo As CTblTpo



' Inisialisation de la classe
'------------------------------------------------------------------------------
'##ModelId=399EEECF0334
Public Function Initialize(con As ADODB.Connection, nomTbl As String, tbltpo As CTblTpo) As Boolean
Attribute Initialize.VB_Description = " Inisialisation de la classe\r\n------------------------------------------------------------------------------"
    Initialize = False
    If Not imSet Then
        Set my_Con = con
        myNomTbl = nomTbl
        myRst.Open myNomTbl, con, adOpenKeyset, adLockOptimistic, -1
        imSet = True
        Initialize = True
        Set my_TblTpo = tbltpo
    End If
End Function

' Recherche d'un organisme par son id
'------------------------------------------------------------------------------
'##ModelId=399DA9880258
Public Function ReadByOrgId(orgId As Long) As COrganisme
Attribute ReadByOrgId.VB_Description = " Recherche d'un organisme par son id\r\n------------------------------------------------------------------------------"
    Set ReadByOrgId = New COrganisme
    With ReadByOrgId
        If imSet And fndRecord(orgId) Then
            .Id = myRst!orgId
            .nom = myRst!orgNom
            .Adresse = myRst!orgAdresse
            .Tel = myRst!orgTel
            Set .TypeOrganisme = my_TblTpo.ReadByTpoId(myRst!tpoId)
        End If
    End With
End Function

' Recherche Des oganismes d'une ville
'------------------------------------------------------------------------------
'##ModelId=39A6E48000E6
Public Function ReadByVleId(vleId As Long) As COrganismes
Attribute ReadByVleId.VB_Description = " Recherche Des oganismes d'une ville\r\n------------------------------------------------------------------------------"
    Set ReadByVleId = New COrganismes
    Dim rqt As ADODB.Recordset
    Set rqt = ReadById("rqtOrgIdByVleId", vleId)
    If Not rqt.BOF Then rqt.MoveFirst
    While Not rqt.EOF
        ReadByVleId.Add ReadByOrgId(rqt!orgId)
        rqt.MoveNext
    Wend
    Set rqt = Nothing
End Function

' Création d'un nouvel organisme
'------------------------------------------------------------------------------
'##ModelId=399E941C02DA
Public Function WriteRecord(ByVal vleId As Long, ByRef organisme As COrganisme) As Boolean
Attribute WriteRecord.VB_Description = " Ajout d'un nouvel organisme\r\n------------------------------------------------------------------------------"
    WriteRecord = True
    With organisme
        If Not fndRecord(.Id) Then
            .Id = nextId
            myRst.AddNew
        End If
        myRst!orgId = .Id
        myRst!orgNom = .nom
        myRst!orgAdresse = .Adresse
        myRst!orgTel = .Tel
        myRst!tpoId = .TypeOrganisme.Id
        myRst!vleId = vleId
        myRst.Update
        myRst.MoveLast
        If Not myRst!orgId = .Id Then WriteRecord = False
    End With
End Function




'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DAA06010E
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DAA060334
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=399EEED0032A
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        If Not myRst.BOF Then myRst.MoveFirst
        myRst.Find "orgId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=399EEED00398
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("orgId").Value
        nextId = nextId + 1
    End If
End Function

' Execute une commande qui a un id en paramètre
'------------------------------------------------------------------------------
'##ModelId=39A6E480030C
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




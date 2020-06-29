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
'Gestion de la table des organismes
Option Explicit

' Membre
'##ModelId=399EEECF01B9
Private myCon As ADODB.Connection   ' Référance sur la connexion sur la db
Attribute myCon.VB_VarDescription = " Membre"
'##ModelId=399EEECF0259
Private myRst As ADODB.Recordset    ' Recordset sur la table des organismes
'##ModelId=399EEECF0294
Private myNomTbl As String          ' Nom de la table des organismes
'##ModelId=399EEECF0302
Private imSet As Boolean            ' Flag de validité de la classe

' Inisialisation de la classe
'------------------------------------------------------------------------------
'##ModelId=399EEECF0334
Public Function Initialize(con As ADODB.Connection, nomTblOrg As String) As Boolean
Attribute Initialize.VB_Description = " Inisialisation de la classe\r\n------------------------------------------------------------------------------"

    If Not imSet Then
        myCon = con
        myNomTbl = nomTblOrg
        myRst.Open myNomTbl, con, adOpenKeyset, adLockOptimistic, -1
        imSet = True
        Initialize = True
    Else
        imSet = False
        Initialize = False
    End If
    
End Function

'##ModelId=399DA9880258
'------------------------------------------------------------------------------
'##ModelId=399DA9880258
Public Function ReadByOrgId(orgId As Long) As COrganisme
Attribute ReadByOrgId.VB_Description = "##ModelId=399DA9880258\r\n------------------------------------------------------------------------------"
    Set ReadByOrgId = New COrganismes
    
    If fndRecord(orgId) Then
        ReadByOrgId.Id = myRst.Fields("orgid").Value
        ReadByOrgId.nom = myRst.Fields("orgNom").Value
        ReadByOrgId.adresse = myRst.Fields("orgAdresse").Value
        ReadByOrgId.tel = myRst.Fields("orgTel").Value
        ReadByOrgId.tpoId = myRst.Fields("tpoId").Value
        ReadByOrgId.vleId = myRst.Fields("vleId").Value
    Else
        ReadByOrgId = Nothing
    End If
    
End Function

' Ajout d'un nouvel organisme
'------------------------------------------------------------------------------
'##ModelId=399E941C02DA
Public Function Insert(nom As String, adresse As String, tel As String, vleId As Long, tpoId As Long) As Boolean
Attribute Insert.VB_Description = "##ModelId=399E941C02DA\r\n------------------------------------------------------------------------------"
    Dim Id As Long
    
    Id = nextId
    myRst.AddNew
        myRst!orgId = Id
        myRst!orgNom = nom
        myRst!ordAdresse = adresse
        myRst!orgTel = tel
        myRst!tpoId = tpoId
        myRst!vleId = vleId
    myRst.Update
    myRst.MoveLast
    If myRst.Fields(orgId).Value = Id Then
        Insert = True
    Else
        Insert = False
    End If
    
End Function

' Modification d'un organisme existant
'------------------------------------------------------------------------------
'##ModelId=399E9421026C
Public Sub Modify(Id As Long, nom As String, adresse As String, tel As String, vleId As Long, tpoId As Long)
Attribute Modify.VB_Description = "##ModelId=399E9421026C\r\n------------------------------------------------------------------------------"
    
    If fndRecord(Id) Then
        myRst.Fields("tpoId").Value = tpoId
        myRst.Fields("vleId").Value = vleId
        myRst.Fields("orgNom").Value = nom
        myRst.Fields("orgAdresse").Value = adresse
        myRst.Fields("orgTel").Value = tel
        myRst.Update
        Modify = True
    Else
        Modify = False
    End If
    
End Sub

' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DAA06010E
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = "##ModelId=399DAA06010E\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DAA060334
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = "##ModelId=399DAA060334\r\n------------------------------------------------------------------------------"
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=399EEED0032A
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
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




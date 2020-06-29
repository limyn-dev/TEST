VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblTpo"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des types d'organismes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DAA6A0122"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des types d'organismes
Option Explicit



' Membres
'##ModelId=399EEECB021D
Private my_Con As ADODB.Connection
Attribute my_Con.VB_VarDescription = " Membres"
'##ModelId=399EEECB02BC
Private myNomTbl As String
'##ModelId=399EEECC005B
Private myRst As ADODB.Recordset
'##ModelId=399EEECC008C
Private imSet As Boolean



' Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=399EEECC0136
Public Function Initialize(con As ADODB.Connection, nomTbl As String) As Boolean
Attribute Initialize.VB_Description = " Initialisation des membres\r\n------------------------------------------------------------------------------"
    Initialize = False
    If Not imSet Then
        Set my_Con = con
        myNomTbl = nomTbl
        myRst.Open myNomTbl, my_Con, adOpenKeyset, adLockOptimistic, -1
        imSet = True
        Initialize = True
    End If
End Function

' Recherche d'un type d'organisme par son id
'------------------------------------------------------------------------------
'##ModelId=399DAA880186
Public Function ReadByTpoId(tpoId As Long) As CTypeOrganisme
Attribute ReadByTpoId.VB_Description = " Recherche d'un type d'organisme par son id\r\n------------------------------------------------------------------------------"
    Set ReadByTpoId = New CTypeOrganisme
    With ReadByTpoId
        If imSet And fndRecord(tpoId) Then
            .Id = myRst!tpoId
            .Designation = myRst!tpoDesignation
        End If
    End With
End Function

' Recherche de tous les types d'organisme
'------------------------------------------------------------------------------
'##ModelId=39A6E47E0320
Public Function ReadAll() As CTypesOrganisme
Attribute ReadAll.VB_Description = " Recherche de tous les types d'organisme\r\n------------------------------------------------------------------------------"
    Set ReadAll = New CTypesOrganisme
    If Not myRst.BOF Then myRst.MoveFirst
    While Not myRst.EOF
        ReadAll.Add ReadByTpoId(myRst!tpoId)
        myRst.MoveNext
    Wend
End Function

' Ajout d'un type d'organisme
'------------------------------------------------------------------------------
'##ModelId=399E9D8E003C
Public Function WriteRecord(tpo As CTypeOrganisme) As Boolean
Attribute WriteRecord.VB_Description = " Ajout d'un type d'organisme\r\n------------------------------------------------------------------------------"
    WriteRecord = True
    With tpo
        If ReadById(tpo.Id) Then
            myRst!tpoId = Id
            myRst!tpoDesignation = Designation
            myRst.Update
        Else
            .Id = nextId
            myRst.AddNew
            myRst!tpoId = .Id
            myRst!tpoDesignation = .Designation
            myRst.Update
        End If
        myRst.MoveLast
        If Not myRst!tpoId = Id Then WriteRecord = False
    End With
End Function



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DAB140078
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DAB13026C
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=399EEECC038E
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        If Not myRst.BOF Then myRst.MoveFirst
        myRst.Find "tpoId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=399EEECD0014
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("tpoId").Value
        nextId = nextId + 1
    End If
End Function

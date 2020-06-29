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
'Gestion de la table des types d'organismes
Option Explicit

' Membres
'##ModelId=399EEECB021D
Private myCon As ADODB.Connection
Attribute myCon.VB_VarDescription = " Membres"
'##ModelId=399EEECB02BC
Private myNomTbl As String
'##ModelId=399EEECC005B
Private myRst As ADODB.Recordset
'##ModelId=399EEECC008C
Private imSet As Boolean

'------------------------------------------------------------------------------
'##ModelId=399EEECC0136
Public Function Initialize(con As ADODB.Connection, nomTblTpo As String) As Boolean
Attribute Initialize.VB_Description = "------------------------------------------------------------------------------"

    If Not imSet Then
        myCon = con
        myNomTbl = nomTblTpo
        myRst.Open myNomTbl, myCon, adOpenKeyset, adLockOptimistic, -1
        imSet = True
        Initialize = True
    Else
        Initialize = False
    End If
    
End Function

'##ModelId=399DAA880186
'------------------------------------------------------------------------------
'##ModelId=399DAA880186
Public Function ReadByTpoId(tpoId As Long) As CTypeOrganisme
Attribute ReadByTpoId.VB_Description = "##ModelId=399DAA880186\r\n------------------------------------------------------------------------------"
    
    Set ReadByTpoId = New CTypeOrganisme
    If fndRecord(tpoId) Then
        ReadByTpoId.Id = myRst.Fields("tpoId").Value
        ReadByTpoId.designation = myRst.Fields("tpoDesignation").Value
    Else
        Set ReadByTpoId = Nothing
    End If
    
End Function

'##ModelId=399E9D8E003C
'------------------------------------------------------------------------------
'##ModelId=399E9D8E003C
Public Function Insert(designation As String) As Boolean
Attribute Insert.VB_Description = "##ModelId=399E9D8E003C\r\n------------------------------------------------------------------------------"
    Dim Id As Long
    
    Insert = False
    Id = nextId
    If Id > 0 Then
        myRst.AddNew
        myRst!tpoId = Id
        myRst!tpoDesignation = designation
        If myRst!tpoId = Id Then Insert = True
    End If
    
End Function

'##ModelId=399E9D92029E
'------------------------------------------------------------------------------
'##ModelId=399E9D92029E
Public Function Modify(Id As Long, designation As String) As Boolean
Attribute Modify.VB_Description = "##ModelId=399E9D92029E\r\n------------------------------------------------------------------------------"

    Modify = False
    If fndRecord(Id) Then
        myRst!tpoDesignation = designation
        Modify = True
    End If
    
End Function

'##ModelId=399DAB140078
'------------------------------------------------------------------------------
'##ModelId=399DAB140078
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = "##ModelId=399DAB140078\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

'##ModelId=399DAB13026C
'------------------------------------------------------------------------------
'##ModelId=399DAB13026C
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = "##ModelId=399DAB13026C\r\n------------------------------------------------------------------------------"
    Set myRst = Nothing
End Sub


'Position du rst
'------------------------------------------------------------------------------
'##ModelId=399EEECC038E
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n##ModelId=399D99B10046\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
        myRst.Find "tpoId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=399EEECD0014
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n##ModelId=399D99B10046\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("tpoId").Value
        nextId = nextId + 1
    End If
End Function

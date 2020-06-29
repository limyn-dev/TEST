VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblAcp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des accompagnateurs"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DBFDB0064"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des accompagnateurs
Option Explicit

'##ModelId=399EF31A0302
Private my_Con As Connection
'##ModelId=399EF33C033E
Private myNomTbl As String
'##ModelId=399EF34C0096
Private myRst As Recordset
'##ModelId=399EF36D0370
Private imSet As Boolean

' Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=39A39A2D0028
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

' Recherche d'un accompagnant par son id
'------------------------------------------------------------------------------
'##ModelId=399DC0750154
Public Function ReadByAcpId(acpId As Long) As CAccompagnateur
Attribute ReadByAcpId.VB_Description = " Recherche d'un accompagnant par son id\r\n------------------------------------------------------------------------------"
    Set ReadByAcpId = New CAccompagnateur
    With ReadByAcpId
        If imSet And fndRecord(acpId) Then
            .Id = myRst!acpId
            .nom = myRst!acpNom
            .prenom = myRst!acpPrenom
            .Adresse = myRst!acpAdresse
            .Tel = myRst!acpTel
        End If
    End With
End Function

'Ajout d'un accompagnateur dans la table
'------------------------------------------------------------------------------
'##ModelId=399DC0870014
Public Function WriteRecord(accompagnateur As CAccompagnateur) As Boolean
Attribute WriteRecord.VB_Description = "Ajout d'un accompagnateur dans la table\r\n------------------------------------------------------------------------------"
    If imSet Then
        WriteRecord = True
        With accompagnateur
            If Not fndRecord(.Id) Then
                .Id = nextId
                myRst.AddNew
            End If
            myRst!acpId = .Id
            myRst!acpNom = .nom
            myRst!acpPrenom = .prenom
            myRst!acpAdresse = .Adresse
            myRst!acpTel = .Tel
            myRst.Update
            myRst.MoveLast
            If Not myRst!acpId = .Id Then WriteRecord = False
        End With
    End If
End Function



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DC1840230
Private Sub Class_Initialize()
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Fin de la classe
'------------------------------------------------------------------------------
'##ModelId=399DC1830384
Private Sub Class_Terminate()
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

' Position du rst
'------------------------------------------------------------------------------
'##ModelId=39A39A2D03D4
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = " Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        If Not myRst.BOF Then myRst.MoveFirst
        myRst.Find "acpId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=39A39A2E005A
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("acpId").Value
        nextId = nextId + 1
    End If
End Function


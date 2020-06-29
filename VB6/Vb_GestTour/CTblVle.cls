VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblVle"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des villes"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399D987B0348"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des villes
Option Explicit

'##ModelId=399EC0BE02D0
Private my_Con As Connection
'##ModelId=399EEED10280
Private myNomTbl As String
'##ModelId=399EB13B0259
Private myRst As ADODB.Recordset
'##ModelId=399EC13F0352
Private imSet As Boolean
'##ModelId=39A6E4940335
Private my_TblOrg As CTblOrg

'Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=399EC15801FE
Public Function Initialize(con As Connection, nomTbl As String, tblOrg As CTblOrg) As Boolean
Attribute Initialize.VB_Description = "Initialisation des membres\r\n------------------------------------------------------------------------------"
    Initialize = False
    If Not imSet Then
        Set my_Con = con
        myNomTbl = nomTbl
        myRst.Open myNomTbl, my_Con, adOpenKeyset, adLockOptimistic, -1
        Set my_TblOrg = tblOrg
        imSet = True
        Initialize = True
    End If
End Function

'Recherche d'une ville par son ID
'------------------------------------------------------------------------------
'##ModelId=39A39A3102C6
Public Function ReadByVleId(ByVal vleId As Long) As CVille
Attribute ReadByVleId.VB_Description = "Recherche d'une ville par son ID\r\n------------------------------------------------------------------------------"
    Set ReadByVleId = New CVille
    With ReadByVleId
        If imSet And fndRecord(vleId) Then
            .Id = myRst!vleId
            .nom = myRst!vleNom
            Set .Organismes = my_TblOrg.ReadByVleId(.Id)
        End If
    End With
End Function

' Liste de toutes les villes de la table
'------------------------------------------------------------------------------
'##ModelId=39A6E4950104
Public Function ReadAll() As CVilles
Attribute ReadAll.VB_Description = " Liste de toutes les villes de la table\r\n------------------------------------------------------------------------------"
    Set ReadAll = New CVilles
    If Not myRst.BOF Then myRst.MoveFirst
    While Not myRst.EOF
        ReadAll.Add ReadByVleId(myRst!vleId)
        myRst.MoveNext
    Wend
End Function

'Ajout d'une nouvelle ville dans la table
'------------------------------------------------------------------------------
'##ModelId=399D98CE03AC
Public Function WriteRecord(ville As CVille) As Boolean
Attribute WriteRecord.VB_Description = "Ajout d'une nouvelle ville dans la table\r\n------------------------------------------------------------------------------"
    Dim org As COrganisme
    
    WriteRecord = True
    With ville
        If Not fndRecord(.Id) Then
            .Id = nextId
            myRst.AddNew
        End If
        myRst!vleId = .Id
        myRst!vleNom = .nom
        myRst.Update
        myRst.MoveLast
        If Not myRst!vleId = .Id Then
            WriteRecord = False
        Else
            For Each org In .Organismes
                my_TblOrg.WriteRecord .Id, org
            Next
        End If
    End With
End Function



'******************************************************************************



'Instanciation de la classe
'------------------------------------------------------------------------------
'##ModelId=399D99B000BE
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = "Instanciation de la classe\r\n------------------------------------------------------------------------------"
     Set myRst = New ADODB.Recordset
     imSet = False
End Sub

'Désinstanciation de la classe
'------------------------------------------------------------------------------
'##ModelId=399D99B10046
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = "Désinstanciation de la classe\r\n------------------------------------------------------------------------------"
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=399EEED2023A
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        If Not myRst.BOF Then myRst.MoveFirst
        myRst.Find "vleId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=399EEED202A8
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("vleId").Value
        nextId = nextId + 1
    End If
End Function





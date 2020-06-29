VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblClt"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des clients"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399D996401B8"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des clients
Option Explicit



'##ModelId=39A39A280033
Private my_Con As ADODB.Connection
'##ModelId=39A39A280064
Private myNomTbl As String
'##ModelId=39A39A280141
Private myRst As ADODB.Recordset
'##ModelId=39A39A280172
Private imSet As Boolean



' Initialisation des membres
'------------------------------------------------------------------------------
'##ModelId=39A39A2801E0
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

'Recherche d'un client par son id
'------------------------------------------------------------------------------
'##ModelId=399D996C03C0
Public Function ReadByCltId(ByVal cltId As Long) As CClient
Attribute ReadByCltId.VB_Description = "Recherche d'un client par son id"
    Set ReadByCltId = New CClient
    With ReadByCltId
        If imSet And fndRecord(cltId) Then
            .Id = myRst!cltId
            .nom = myRst!cltNom
            .prenom = myRst!cltPrenom
            .Adresse = myRst!cltAdresse
            .Tel = myRst!cltTel
        End If
    End With
End Function

' Ajout d'un nouveau client dans la table
'------------------------------------------------------------------------------
'##ModelId=39A6E48D0352
Public Function WriteRecord(ByRef Client As CClient) As Boolean
Attribute WriteRecord.VB_Description = " Ajout d'un nouveau client dans la table\r\n------------------------------------------------------------------------------"
    If imSet Then
        WriteRecord = True
        With Client
            If Not fndRecord(.Id) Then
                .Id = nextId
                myRst.AddNew
            End If
            myRst!cltId = .Id
            myRst!cltNom = .nom
            myRst!cltPrenom = .prenom
            myRst!cltAdresse = .Adresse
            myRst!cltTel = .Tel
            myRst.Update
            myRst.MoveLast
            If Not myRst!cltId = .Id Then WriteRecord = False
        End With
    End If
End Function



'******************************************************************************



' Instanciation de la classe
'------------------------------------------------------------------------------
'##ModelId=399D9A4B012C
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation de la classe\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation de la classe
'------------------------------------------------------------------------------
'##ModelId=399D9A4B0352
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation de la classe\r\n------------------------------------------------------------------------------"
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

' Position du rst
'------------------------------------------------------------------------------
'##ModelId=39A39A290168
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = " Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        If Not myRst.BOF Then myRst.MoveFirst
        myRst.Find "cltId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=39A39A2901D6
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("cltId").Value
        nextId = nextId + 1
    End If
End Function



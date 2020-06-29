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
'Gestion de la table des villes
Option Explicit

'##ModelId=399EC0BE02D0
Private myCon As Connection
'##ModelId=399EEED10280
Private myNomTbl As String
'##ModelId=399EB13B0259
Private myRst As ADODB.Recordset
'##ModelId=399EC13F0352
Private imSet As Boolean

'Initialisation des membres
'##ModelId=399EC15801FE
'------------------------------------------------------------------------------
'##ModelId=399EC15801FE
Public Function Initialize(con As Connection, nomTblVle As String) As Boolean
Attribute Initialize.VB_Description = "Initialisation des membres\r\n##ModelId=399EC15801FE\r\n------------------------------------------------------------------------------"
    
    ' Initialisation de la connexion
    Set myCon = con
    
    ' Copie du nom de la table des ville
    myNomTbl = nomTblVle
    
    ' Ouverture de la table des villes
    myRst.Open myNomTbl, myCon, adOpenKeyset, adLockOptimistic, -1
    
    ' Validation du flag
    imSet = True
    
End Function

'Recherche d'une ville par son ID
'##ModelId=399D988702BC
'------------------------------------------------------------------------------
'##ModelId=399D988702BC
Public Function ReadByVilId(ByVal vleId As Long) As CVille
Attribute ReadByVilId.VB_Description = "Recherche d'une ville par son ID\r\n##ModelId=399D988702BC\r\n------------------------------------------------------------------------------"
    Set ReadByVilId = New CVille
    
    If fndRecord(vleId) Then
        ReadByVilId.Id = myRst.Fields("vleId").Value
        ReadByVilId.Nom = myRst.Fields("vleNom").Value
    Else
        Set ReadByVilId = Nothing
    End If
    
End Function

'Ajout d'une nouvelle ville dans la table
'##ModelId=399D98CE03AC
'------------------------------------------------------------------------------
'##ModelId=399D98CE03AC
Public Function Insert(Nom As String) As Boolean
Attribute Insert.VB_Description = "Ajout d'une nouvelle ville dans la table\r\n##ModelId=399D98CE03AC\r\n------------------------------------------------------------------------------"
    Dim Id As Integer

    Id = nextId
    myRst.AddNew
    myRst!vleId = Id
    myRst!vleNom = Nom
    myRst.Update
    myRst.MoveLast
    If myRst.Fields("vleId").Value = Id Then
        Insert = True
    Else
        Insert = False
    End If
    
End Function

'Modification d'une ville existante
'##ModelId=399DBE1F02B2
'------------------------------------------------------------------------------
'##ModelId=399DBE1F02B2
Public Function Modify(Id As Long, Nom As String) As Boolean
Attribute Modify.VB_Description = "Modification d'une ville existante\r\n##ModelId=399DBE1F02B2\r\n------------------------------------------------------------------------------"
    If fndRecord(Id) Then
        myRst.Update "vleNom", Nom
        Modify = True
    Else
        Modify = False
    End If
End Function

'Instanciation de la classe
'##ModelId=399D99B000BE
'------------------------------------------------------------------------------
'##ModelId=399D99B000BE
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = "Instanciation de la classe\r\n##ModelId=399D99B000BE\r\n------------------------------------------------------------------------------"
     Set myRst = New ADODB.Recordset
End Sub

'Désinstanciation de la classe
'------------------------------------------------------------------------------
'##ModelId=399D99B10046
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = "Désinstanciation de la classe\r\n##ModelId=399D99B10046\r\n------------------------------------------------------------------------------"
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=399EEED2023A
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n##ModelId=399D99B10046\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
        myRst.Find "vleId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=399EEED202A8
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n##ModelId=399D99B10046\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("vleId").Value
        nextId = nextId + 1
    End If
End Function



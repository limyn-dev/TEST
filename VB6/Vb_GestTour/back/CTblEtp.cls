VERSION 1.0 CLASS
BEGIN
  MultiUse = -1  'True
  Persistable = 0  'NotPersistable
  DataBindingBehavior = 0  'vbNone
  DataSourceBehavior  = 0  'vbNone
  MTSTransactionMode  = 0  'NotAnMTSObject
END
Attribute VB_Name = "CTblEtp"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Attribute VB_Description = "Gestion de la table des étapes d'un circuit"
Attribute VB_Ext_KEY = "RVB_UniqueId" ,"399DB1220294"
Attribute VB_Ext_KEY = "RVB_ModelStereotype" ,"Class Module"
'Gestion de la table des étapes d'un circuit
Option Explicit

Private myCon As ADODB.Connection   ' Référance sur la connexion sur la db
Private myRst As ADODB.Recordset    ' Recordset sur la table des organismes
Private myNomTbl As String          ' Nom de la table des organismes
Private imSet As Boolean            ' Flag de validité de la classe
Private myTblCrt As CTblCrt
Private myTblVle As CTblVle

' Inisialisation des membres
'------------------------------------------------------------------------------
Public Function Initialize(con As ADODB.Connection, nomTblEtp As String, tblCrt As CTblCrt, tblVle As CTblVle) As Boolean
    If Not imSet Then
        myCon = con
        myNomTbl = nomTblEtp
        myRst.Open myNomTbl, con, adOpenKeyset, adLockOptimistic, -1
        myTblCrt = tblCrt
        myTblVle = tblVle
        imSet = True
        Initialize = True
    Else
        imSet = False
        Initialize = False
    End If
End Function

' Recheche d'une étape par son id
'------------------------------------------------------------------------------
Public Function ReadByEtpId(etpId As Long) As CEtape
Attribute ReadByEtpId.VB_Description = "Recheche des étapes par leur id"
    If fndRecord(etpId) Then
        Set ReadByEtpId = New CEtape
        With ReadByEtpId
            .Id = myRst!etpId
            .Numero = myRst!etpNumero
            .ArriveeHeure = myRst!etpArriveeHeure
            .DepartHeure = myRst!etpDepartHeure
            .Circuit = myTblCrt.ReadByCrtId(myRst!crtId)
            .Ville = myTblVle.readbyvleid(myRst!vleId)
        End With
    Else
        Set ReadByEtpId = Nothing
    End If
End Function

'Recherche des étapes d'un même circuit
'------------------------------------------------------------------------------
Public Function EtapesByCircuits(crtId As Long) As CEtapes
Attribute EtapesByCircuits.VB_Description = "Recherche des étapes d'un même circuit"
    Dim rqt As ADODB.Recordset
    
    ' Recherche des étapes
    Set rqt = ReadById("rqtEtpIdByCrtId", crtId)
    
    ' Création de la collection des étapes en fonction de leur id
    If Not rqt = Nothing Then
        Set EtapesByCircuits = New CEtapes
        rqt.MoveFirst
        While Not rqt.EOF
            EtapesByCircuits.Add ReadByEtpId(rqt!etpId)
            rqt.MoveNext
        Wend
    Else
        Set ReadByOrgId = Nothing
    End If
        
    Set rqt = Nothing
End Function

' Ajout d'une nouvelle étape
'------------------------------------------------------------------------------
Public Sub Insert(Numero As Integer, ArriveeHeure As Date, DepartHeure As Date, crtId As Long, vleId As Long)
Attribute Insert.VB_Description = "Ajout d'une étape dans un circuit"
    Dim Id As Long
    
    Id = nextId
    myRst.AddNew
        myRst!etpId = Id
        myRst!etpNumero = Numero
        myRst!etpArriveeHeure = ArriveeHeure
        myRst!etpDepartHeure = DepartHeure
        myRst!crtId = crtId
        myRst!vleId = vleId
    myRst.Update
    myRst.MoveLast
    If myRst!etpId = Id Then
        Insert = True
    Else
        Insert = False
    End If

End Sub

' Modification d'une étape existante
'------------------------------------------------------------------------------
'##ModelId=399DB1AB0064
Public Sub Modify(Id As Long, Numero As Integer, ArriveeHeure As Date, DepartHeure As Date, crtId As Long, vleId As Long)
   If fndRecord(Id) Then
        myRst!etpId = Id
        myRst!Numero = Numero
        myRst!ArriveeHeure = ArriveeHeure
        myRst!DepartHeure = DepartHeure
        myRst!crtId = crtId
        myRst!vleId = vleId
        myRst.Update
        Modify = True
    Else
        Modify = False
    End If
End Sub



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
Private Sub Class_Terminate()
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
Private Sub Class_Initialize()
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
Private Function fndRecord(Id As Long) As Boolean
    fndRecord = False
    If imSet Then
        myRst.MoveFirst
        myRst.Find "etpId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
Private Function nextId() As Long
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("etpId").Value
        nextId = nextId + 1
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



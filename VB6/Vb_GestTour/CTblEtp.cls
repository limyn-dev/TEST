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
Attribute VB_Ext_KEY = "SavedWithClassBuilder6" ,"Yes"
Attribute VB_Ext_KEY = "Top_Level" ,"Yes"
'Gestion de la table des étapes d'un circuit
Option Explicit

'##ModelId=399EC02802C6
Private my_Con As ADODB.Connection   ' Référance sur la connexion sur la db
'##ModelId=39A39A120317
Private myRst As ADODB.Recordset    ' Recordset sur la table des organismes
'##ModelId=399EEF970398
Private myNomTbl As String          ' Nom de la table des organismes
'##ModelId=39A39A1203B6
Private imSet As Boolean            ' Flag de validité de la classe
'##ModelId=39A39A13003D
Private my_TblCtc As CTblCtc
'##ModelId=39A39A1300AB
Private my_TblVle As CTblVle

' Inisialisation des membres
'------------------------------------------------------------------------------
'##ModelId=399EEFAD01F4
Public Function Initialize(con As ADODB.Connection, nomTbl As String, tblCtc As CTblCtc, tblVle As CTblVle) As Boolean
Attribute Initialize.VB_Description = " Inisialisation des membres\r\n------------------------------------------------------------------------------"
    Initialize = False
    If Not imSet Then
        Set my_Con = con
        Set my_TblCtc = tblCtc
        Set my_TblVle = tblVle
        myNomTbl = nomTbl
        myRst.Open myNomTbl, con, adOpenKeyset, adLockOptimistic, -1
        imSet = True
        Initialize = True
    End If
End Function

' Recheche d'une étape par son id
'------------------------------------------------------------------------------
'##ModelId=399DB1410280
Public Function ReadByEtpId(etpId As Long) As CEtape
Attribute ReadByEtpId.VB_Description = " Recheche d'une étape par son id\r\n------------------------------------------------------------------------------"
    Set ReadByEtpId = New CEtape
    With ReadByEtpId
        If imSet And fndRecord(etpId) Then
            .Id = myRst!etpId
            .Numero = myRst!etpNumero
            .ArriveeHeure = myRst!etpArriveeHeure
            .DepartHeure = myRst!etpDepartHeure
            Set .ville = my_TblVle.ReadByVleId(myRst!vleId)
        End If
    End With
End Function

' Recherche des étapes d'un même circuit
'------------------------------------------------------------------------------
'##ModelId=39A39A13029E
Public Function ReadByCrtId(crtId As Long) As CEtapes
Attribute ReadByCrtId.VB_Description = " Recherche des étapes d'un même circuit\r\n------------------------------------------------------------------------------"
    Dim rqt As ADODB.Recordset
    
    Set ReadByCrtId = New CEtapes
    Set rqt = ReadById("rqtEtpIdByCrtId", crtId)
    If Not rqt.BOF Then rqt.MoveFirst
    While Not rqt.EOF
        ReadByCrtId.Add ReadByEtpId(rqt!etpId)
        rqt.MoveNext
    Wend
    Set rqt = Nothing
End Function

' Ajout d'une nouvelle étape
'------------------------------------------------------------------------------
'##ModelId=399DB151019A
Public Function WriteRecord(ByVal crtId As Long, ByRef etape As CEtape) As Boolean
Attribute WriteRecord.VB_Description = " Ajout d'une nouvelle étape\r\n------------------------------------------------------------------------------"
    WriteRecord = True
    With etape
        If Not fndRecord(.Id) Then
            .Id = nextId
            myRst.AddNew
        End If
        myRst!etpId = .Id
        myRst!etpNumero = .Numero
        myRst!etpArriveeHeure = .ArriveeHeure
        myRst!etpDepartHeure = .DepartHeure
        myRst!vleId = .ville.Id
        myRst!crtId = crtId
        myRst.Update
        myRst.MoveLast
        If Not myRst!etpId = .Id Then
            WriteRecord = False
        Else
            my_TblVle.WriteRecord .ville
            my_TblCtc.WriteRecord etape
        End If
    End With
End Function

' Modification d'une étape existante
'------------------------------------------------------------------------------
'##ModelId=399DB1AB0064
Public Sub Modify(Id As Long, Numero As Integer, ArriveeHeure As Date, DepartHeure As Date, crtId As Long, vleId As Long)
Attribute Modify.VB_Description = " Modification d'une étape existante\r\n------------------------------------------------------------------------------"
   If fndRecord(Id) Then
        
        Modify = True
    Else
        Modify = False
    End If
End Sub



'******************************************************************************



' Instanciation
'------------------------------------------------------------------------------
'##ModelId=399DBF440294
Private Sub Class_Initialize()
Attribute Class_Initialize.VB_Description = " Instanciation\r\n------------------------------------------------------------------------------"
    Set myRst = New ADODB.Recordset
    imSet = False
End Sub

' Désinstanciation
'------------------------------------------------------------------------------
'##ModelId=399DBF440000
Private Sub Class_Terminate()
Attribute Class_Terminate.VB_Description = " Désinstanciation\r\n------------------------------------------------------------------------------"
    If myRst.State = adStateOpen Then myRst.Close
    Set myRst = Nothing
End Sub

'Position du rst
'------------------------------------------------------------------------------
'##ModelId=39A39A140294
Private Function fndRecord(Id As Long) As Boolean
Attribute fndRecord.VB_Description = "Position du rst\r\n------------------------------------------------------------------------------"
    fndRecord = False
    If imSet Then
        If Not myRst.BOF Then myRst.MoveFirst
        myRst.Find "etpId=" & CStr(Id)
        If Not myRst.EOF Then fndRecord = True
    End If
End Function

' Prochain id de la table
'------------------------------------------------------------------------------
'##ModelId=39A39A140302
Private Function nextId() As Long
Attribute nextId.VB_Description = " Prochain id de la table\r\n------------------------------------------------------------------------------"
    nextId = -1
    If imSet Then
        myRst.MoveLast
        nextId = myRst.Fields("etpId").Value
        nextId = nextId + 1
    End If
End Function

' Execute une commande qui a un id en paramètre
'------------------------------------------------------------------------------
'##ModelId=39A39A140334
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


